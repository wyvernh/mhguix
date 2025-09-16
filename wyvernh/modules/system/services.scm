(define-module (wyvernh modules system services)
  #:use-module (wyvernh modules tools)
  #:use-module (wyvernh modules system channels)
  #:use-module (wyvernh modules system services kmonad)
  #:use-module (gnu)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages avahi)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages nfs)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages scanner)
  #:use-module (gnu packages suckless)
  #:use-module (gnu packages sugar)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu services)
  #:use-module (gnu services avahi)
  #:use-module (gnu services base)
  #:use-module (gnu services dbus)
  #:use-module (gnu services desktop)
  #:use-module (gnu services linux)
  #:use-module (gnu services networking)
  #:use-module (gnu services shepherd)
  #:use-module (gnu services sound)
  #:use-module (gnu services xorg)
  #:use-module (gnu system privilege)
  #:use-module (nongnu packages nvidia)
  #:use-module (nongnu services nvidia)
  #:use-module (guix channels)
  #:use-module (srfi srfi-1)
  #:export (services-from))

(define %wyvernh-base-services
  (modify-services
   %base-services
   (console-font-service-type
    config => (map (lambda (tty)
                     (cons tty (file-append font-terminus
                                            "/share/consolefonts/ter-132n")))
                   '("tty1" "tty2" "tty3" "tty4" "tty5" "tty6")))))

(define kmonad
 (lambda (lst users hostname)
   (cons
    (service kmonad-service-type (kmonad-configuration
                                  (hostname hostname)))
    (modify-services
     lst
     (udev-service-type
      config => (udev-configuration
                 (inherit config)
                 (rules (cons (@ (gnu packages haskell-apps) kmonad)
                              (udev-configuration-rules config)))))))))

(define autologin
  (lambda (lst users hostname)
    (if (zero? (length users))
        lst
        (let ((name (user-account-name (car users))))
          (modify-services
           lst
           (mingetty-service-type
            config => (if (string=? "tty1" (mingetty-configuration-tty config))
                          (mingetty-configuration
                           (inherit config)
                           (auto-login name))
                          config)))))))

(define %swaylock-service
  (service
   screen-locker-service-type
   (screen-locker-configuration
    (name "swaylock")
    (program swaylock)
    (using-pam? #t)
    (using-setuid? #f))))

(define desktop
  (lambda (lst users hostname)
    (cons*
     %swaylock-service
     (udev-rules-service 'pipewire-add-udev-rules pipewire)
     ;; Add udev rules for MTP devices so that non-root users can access
     ;; them.
     (simple-service 'mtp udev-service-type (list libmtp))
     ;; Add udev rules for scanners.
     (service sane-service-type)
     ;; Add polkit rules, so that non-root users in the wheel group can
     ;; perform administrative tasks (similar to "sudo").
     polkit-wheel-service

     ;; Allow desktop users to also mount NTFS and NFS file systems
     ;; without root.
     (simple-service 'mount-setuid-helpers privileged-program-service-type
                     (map file-like->setuid-program
                          (list (file-append nfs-utils "/sbin/mount.nfs")
                                (file-append ntfs-3g "/sbin/mount.ntfs-3g"))))

     ;; Add some of the artwork niceties for the desktop.
     (simple-service 'guix-artwork
                     profile-service-type
                     %base-packages-artwork)

     ;; Provides a nicer experience for VTE-using terminal emulators
     (service vte-integration-service-type)

     ;; The global fontconfig cache directory can sometimes contain
     ;; stale entries, possibly referencing fonts that have been GC'd,
     ;; so mount it read-only.
     fontconfig-file-system-service

     ;; NetworkManager and its applet.
     (service network-manager-service-type)
     (service wpa-supplicant-service-type)    ;needed by NetworkManager
     (simple-service 'network-manager-applet
                     profile-service-type
                     (list network-manager-applet))
     (service modem-manager-service-type)
     (service usb-modeswitch-service-type)

     ;; The D-Bus clique.
     (service avahi-service-type)
     (service udisks-service-type)
     (service upower-service-type)
     (service accountsservice-service-type)
     (service cups-pk-helper-service-type)
     (service colord-service-type)
     (service geoclue-service-type)
     (service polkit-service-type)
     (service elogind-service-type)
     (service dbus-root-service-type)

     (service ntp-service-type)

     (service x11-socket-directory-service-type)

     (service pulseaudio-service-type)
     (service alsa-service-type)

     lst)))

(define substitutes
  (lambda (lst users hostname)
    (modify-services
     lst
     (guix-service-type
      config => (guix-configuration
                 (inherit config)
                 (substitute-urls
                  (append (list "https://substitutes.nonguix.org")
                          %default-substitute-urls))
                 (authorized-keys
                  (append
                   (list
                    (plain-file "non-guix.pub"
                                "\
(public-key
 (ecc
  (curve Ed25519)
  (q #C1FD53E5D4CE971933EC50C9F307AE2171A2D3B52C804642A7A35F84F3A4EA98#)))"))
                   %default-authorized-guix-keys)))))))

;; CHANNELS OPTIONS

(define (add-channels channels lst)
  (modify-services
   lst
   (guix-service-type
    config => (guix-configuration (inherit config) (channels channels)))))

;; HARDWARE OPTIONS

(define intel (lambda (lst users hostname) lst))

(define amd (lambda (lst users hostname) lst))

(define nvidia
  (lambda (lst users hostname)
    (cons*
     (service nvidia-service-type)
     (simple-service
      'custom-udev-rules udev-service-type
      (list nvidia-driver))
     (service kernel-module-loader-service-type
              '("ipmi_devintf"
                "nvidia"
                "nvidia_modeset"
                "nvidia_uvm"))
     lst)))

(define amdgpu (lambda (lst users hostname) lst))

;; PACKAGE CHANNELS

(define core '())
(define extras '())

;; Build services-from

(define current-env (interaction-environment))

(define (get-lambdas sources)
  (map (lambda (datum) (if (symbol? datum) (eval datum current-env) datum)) sources))

(define (apply-lambdas sources users hostname lst)
  (fold (lambda (proc l) (apply proc (list l users hostname))) lst (get-lambdas sources)))

(define (get-channel-from symbol)
  (find (lambda (e) (eq? symbol (channel-name e))) %wyvernh-channels))

(define (get-channels lst)
  (map get-channel-from (delete-duplicates lst eq?)))

(define (channel-list channels packages)
  (append (get-channels (append channels (eval-reduce packages current-env)))
          %wyvernh-base-channels))

(define (services-from svcs channels hardware users hostname packages)
  (add-channels
   (channel-list channels packages)
   (apply-lambdas hardware users hostname
                  (apply-lambdas svcs users hostname %wyvernh-base-services))))
