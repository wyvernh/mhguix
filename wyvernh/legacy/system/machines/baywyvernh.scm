(define-module (wyvernh system machines baywyvernh)
  #:use-module (wyvernh system machines)
  #:use-module (gnu)
  #:use-module (gnu packages fonts)
  #:use-module (gnu services base)
  #:use-module (gnu system)
  #:use-module (gnu system file-systems)
  #:export (wyvernh-system-baywyvernh))

(define fs-root
  (file-system
   (mount-point "/")
   (type "btrfs")
   (device (file-system-label "Guix"))
   ;(options (wyvernh-btrfs-mount-options "@"))
   ;(needed-for-boot? #t)
   )
  )

(define fs-efi
  (file-system
    (mount-point "/efi")
    (device (file-system-label "EFI SYSTEM"))
    (type "vfat")))

(define fs-home
  (file-system
    (mount-point "/home")
    (device (file-system-label "HOME"))
    (type "btrfs")))

(define %baywyvernh-swap-devices
  (list (swap-space (target (file-system-label "Swap")))))

(define wyvernh-system-bawyvernh
  (operating-system
    (inherit %wyvernh-base-operating-system)
    (host-name "baywyvernh")
    (file-systems
     (append
      (list fs-root
            fs-efi
            fs-home)
      %base-file-systems))
    (swap-devices %baywyvernh-swap-devices)
    (services
     (append
     (modify-services
      %wyvernh-base-services
      (console-font-service-type
       config => (map (lambda (tty)
                        (cons tty (file-append font-terminus "/share/consolefonts/ter-132n")))
                      '("tty1" "tty2" "tty3" "tty4" "tty5" "tty6"))))
     (list
      ;;(simple-service 'ubcsecure-nmconnection etc-service-type
      ;;                (list `("NetworkManager/system-connections/ubcsecure.nmconnection"
      ;;,ubcsecure-nmconnection)))
      )))))

wyvernh-system-bawyvernh
