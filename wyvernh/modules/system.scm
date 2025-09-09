(define-module (wyvernh modules system)
  #:use-module (wyvernh modules tools)
  #:use-module (wyvernh modules system kernel-lm)
  #:use-module (wyvernh modules system kernel-arg)
  #:use-module (wyvernh modules system firmware)
  #:use-module (wyvernh modules system filesystems)
  #:use-module (wyvernh modules system users)
  #:use-module (wyvernh modules system packages)
  #:use-module (wyvernh modules system services)
  #:use-module (gnu)
  #:use-module (gnu packages linux)
  #:use-module (gnu system)
  #:use-module (gnu system linux-initrd)
  #:use-module (nongnu packages linux)
  #:use-module (nongnu system linux-initrd)
  #:export (os disk system-config))

(define default-timezone "America/Vancouver")
(define default-locale "en_CA.utf8")
(define default-kernel 'linux)
(define default-initrd 'microcode-initrd)
(define default-hardware '())
(define default-firmware '(linux-firmware))
(define default-drive "/dev/nvme0n1")
(define default-filesystems
  '((fs-efi #:size "500M" #:type "vfat")
    (fs-root #:size "100G" #:type "btrfs")
    (fs-swap #:size "18G")
    (fs-home #:size "*" #:type "btrfs")))
(define default-users '((desktop-user "matthew" "Matthew Hinton")))
(define default-groups '(plugdev uinput))
(define default-packages '(core extras))
(define default-services '((kmonad) (desktop) (autologin) (substitutes)))

(define (get-hostname)
  (symbol->string (car (last-pair (module-name (current-module))))))

(define default-operating-system
  (operating-system
   (host-name "wyvernh")
   (kernel linux)
   (keyboard-layout (keyboard-layout "us"))
   (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets '("/efi"))
                (keyboard-layout keyboard-layout)))
   (file-systems %base-file-systems)
   (name-service-switch %mdns-host-lookup-nss)))

(define os #f)
(define disk #f)

(define current-env (interaction-environment))

;; returns disk so that the mhdisk program can directly load
;; a system config file ending with a call to system-config
(define system-config
  (lambda*
   (#:key
    (timezone default-timezone)
    (locale default-locale)
    (kernel default-kernel)
    (initrd default-initrd)
    (kernel-loadable-modules '())
    (kernel-arguments '())
    (hardware default-hardware)
    (firmware default-firmware)
    (drive default-drive)
    (filesystems default-filesystems)
    (users default-users)
    (groups default-groups)
    (channels '())
    (packages default-packages)
    (services default-services))

   (set!
    os
    (operating-system
     (inherit default-operating-system)
     (host-name (get-hostname))
     (timezone timezone)
     (locale locale)
     (kernel (eval kernel current-env))
     (initrd (eval initrd current-env))
     (kernel-loadable-modules
      (eval-reduce (append kernel-loadable-modules hardware) kernel-lm-env))
     (kernel-arguments
      (append %default-kernel-arguments
              (eval-reduce (append kernel-arguments hardware) kernel-arg-env)))
     (firmware
      (eval-reduce (append firmware hardware) firmware-env))
     (file-systems (filesystems-from filesystems))
     (swap-devices (swap-devices-from filesystems mapped-devices))
     (users (users-from users))
     (groups (groups-from groups users))
     (packages (packages-from packages))
     (services (services-from services channels hardware))))

   (set! disk (list drive (disk-from filesystems)))

   disk))

(system-config)
