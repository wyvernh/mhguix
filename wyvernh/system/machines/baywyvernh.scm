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

(define %baywyvernh-swap-devices
  (list (swap-space (target (file-system-label "Swap")))))

;(define fs-swap
;  (file-system
;   (mount-point "/swap")
;   (type "btrfs")
;   (device (file-system-label "nvme-root"))
;   (options "subvol=@swap")
;   (needed-for-boot? #t)))

;(define fs-home
;  (file-system
;   (mount-point "/home")
;   (type "btrfs")
;   (device (file-system-label "nvme-root"))
;   (options (plt-btrfs-mount-options "@home"))))

;(define fs-snapshots
;  (file-system
;   (mount-point "/.snapshots")
;   (type "btrfs")
;   (device (file-system-label "nvme-root"))
;   (options (plt-btrfs-mount-options "@snapshots"))))

(define ubcsecure-nmconnection
  (plain-file "ubcsecure.nmconnection"
              "[connection]
id=ubcsecure
uuid=a99e522c-332e-4672-a0ad-f42816098fa0
type=wifi
permissions=user:matthew:;

[wifi]
mode=infrastructure
ssid=ubcsecure

[wifi-security]
key-mgmt=wpa-eap
psk=physics and music composition

[802-1x]
eap=peap;
identity=mttwhtn
password=physics and music composition
phase2-auth=mschapv2

[ipv4]
method=auto

[ipv6]
addr-gen-mode=default
method=auto

[proxy]"))

(define wyvernh-system-bawyvernh
  (operating-system
    (inherit %wyvernh-base-operating-system)
    (host-name "baywyvernh")
    (file-systems
     (append
      (list fs-root
            fs-efi)
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
      (simple-service 'ubcsecure-nmconnection etc-service-type
                      (list `("NetworkManager/system-connections/ubcsecure.nmconnection"
			      ,ubcsecure-nmconnection))))))))

wyvernh-system-bawyvernh
