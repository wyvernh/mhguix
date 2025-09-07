(define-module (wyvernh modules system)
  #:use-module (wyvernh modules tools)
  #:use-module (wyvernh modules system kernel-lm)
  #:use-module (wyvernh modules system kernel-arg)
  #:use-module (wyvernh modules system firmware)
  #:use-module (wyvernh modules system filesystems)
  #:use-module (wyvernh modules system users)
  #:use-module (wyvernh modules system groups)
  #:use-module (wyvernh modules system packages)
  #:use-module (wyvernh modules system services)
  #:export (system disk system-config))

(define default-hardware '())
(define default-firmware '(linux-firmware))
(define default-filesystems
  '((fs-efi (size "500M") (type "vfat"))
    (fs-root (size "100G") (type "btrfs"))
    (fs-swap (size "18G"))
    (fs-home (size "*") (type "btrfs"))))
(define default-users '((basic-user "matthew" "Matthew Hinton")))
(define default-groups '(plugdev uinput))
(define default-packages '(core extras))
(define default-services '('kmonad 'desktop 'autologin 'substitutes))

(define system #f)
(define disk #f)

(define (get-hostname)
  (symbol->string (car (last-pair (module-name (current-module))))))

(define system-config
  (lambda*
   (#:key
    (kernel-loadable-modules '())
    (kernel-arguments '())
    (hardware default-hardware)
    (firmware default-firmware)
    (filesystems default-filesystems)
    (users default-users)
    (groups default-groups)
    (channels '())
    (packages default-packages)
    (services default-services)
    . os-config-list)
   (define my-system
     (operating-system
      (inherit default-operating-system)
      (kernel-loadable-modules
       (eval-reduce (append kernel-loadable-modules hardware) kernel-lm-env))
      (kernel-arguments
       (append %default-kernel-arguments
               (eval-reduce (append kernel-arguments hardware) kernel-arg-env)))
      (initrd microcode-initrd)
      (firmware
       (eval-reduce (append firmware hardware) firmware-env))
      (host-name (get-hostname))
      (file-systems (filesystems-from filesystems))
      (swap-devices (swap-devices-from filesystems))
      (users (users-from users))
      (groups (groups-from groups users))
      (packages (packages-from packages))
      (services (services-from services channels (map quote hardware)))))
   (set! system (apply operating-system (inherit my-system) os-config-list))
   (set! disk (disk-from filesystems))
   #f))

(system-config)
