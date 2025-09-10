(define-module (wyvernh systems baywyvernh)
  #:use-module (wyvernh modules home)
  #:use-module (wyvernh modules system)
  #:re-export (home os disk))

(home-config
 ;#:packages '(core wyvernh latex emacs engineering)
 #:packages '(core desktop)
 #:services '(desktop shepherd))

(system-config
 ;#:hardware '(nvidia)
 #:filesystems '((fs-efi #:size "1899M" #:type "vfat")
                 (fs-other #:size "16M")
                 (fs-other #:size "64G")
                 (fs-root #:size "128G" #:type "btrfs")
                 (fs-other #:size "128G" #:type "ext4")
                 (fs-other #:size "32G" #:type "swap")
                 (fs-home #:size "600G" #:type "btrfs"))
 #:channels '(guix-science-nonfree)
 #:services '((kmonad) (desktop) (substitutes)))
