(define-module (wyvernh modules system services)
  #:use-module (wyvernh modules tools)
  #:use-module (wyvernh modules system channels)
  #:export (services-from))

(define* (kmonad #:optional (path "/home/matthew/.config/kmonad/config.kbd"))
  (lambda (lst)
    (cons
     (kmonad-service path)
     (modify-services
      lst
      (udev-service-type
       config => (udev-configuration
                  (inherit config)
                  (rules (cons kmonad (udev-configuration-rules config)))))))))

(define* (autologin #:optional (name "matthew") (tty "tty1"))
  (lambda (lst)
    (modify-services
     lst
     (mingetty-service-type
      config => (if (string=? tty (mingetty-configuration-tty config))
                    (mingetty-configuration
                     (inherit config)
                     (auto-login name))
                    config)))))

(define* %swaylock-service
  (service
   screen-locker-service-type
   (screen-locker-configuration
    (name "swaylock")
    (program (file-append swaylock "/bin/swaylock"))
    (using-pam? #t)
    (using-setuid? #f))))

(define* (desktop #:optional (swaylock #t))
  (lambda (lst)
    (let newlst
        (cons*
         (udev-rules-service 'pipewire-add-udev-rules pipewire)
         (append (modify-services %desktop-services (delete gdm-service-type)) lst))
      (if swaylock (cons %swaylock-service newlst) newlst))))

(define (base)
  (lambda (lst)
    (append %base-services lst)))

(define (substitutes)
  (lambda (lst)
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

(define intel (lambda (lst) lst))

(define amd (lambda (lst) lst))

(define nvidia
  (lambda (lst)
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

(define amdgpu (lambda (lst) lst))

(define current-env (interaction-environment))

(define (get-lambdas sources)
  (eval-map sources current-env))

(define (apply-lambdas sources lst)
  (fold lst apply (get-lambdas sources)))

(define (channel-list channels)
  (append (eval-reduce channels current-env) %wyvernh-base-channels))

(define (services-from svcs channels hardware)
  (add-channels
   (channel-list channels)
   (apply-lambdas hardware (apply-lambdas svcs '()))))
