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
 #:filesystems '((fs-efi #:size (* 1899 MiB) #:type "vfat")
                 (fs-other #:size (* 16 MiB)
                 (fs-other #:size (* 64 GiB))
                 (fs-root #:size (* 128 GiB) #:type "btrfs")
                 (fs-other #:size (* 128 GiB) #:type "ext4")
                 (fs-other #:size (* 32 GiB) #:type "swap")
                 (fs-home #:size 'guess #:type "btrfs"))
 #:channels '(guix-science-nonfree)
 #:services '(kmonad desktop substitutes))
