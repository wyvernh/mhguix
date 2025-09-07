(define-module (wyvernh system baywyvernh)
  #:use-module (wyvernh modules home)
  #:use-module (wyvernh modules system)
  #:export (home system disk))

;(define custom-pkgs (list))

;; Defines variable 'home' (home configuration type)
;(home-config
; #:packages '(core wyvernh latex emacs engineering custom-pkgs)
; #:services '(sway '()))


;; Defines variables 'system' (operating system type) and 'disk' (data structure representing disk partition layout for external partitioning program)
(system-config
 #:hardware '(nvidia)
 #:filesystems '((fs-efi (size "500M") (type "vfat"))
                 (fs-root (size "20G") (type "btrfs"))
                 (fs-gnu (size "100G") (type "ext4"))
                 (fs-swap (size "18G"))
                 (fs-other (size "200G") (type "ext4"))
                 (fs-home (size "600G") (type "btrfs")))
 #:channels '(guix-science-nonfree))
