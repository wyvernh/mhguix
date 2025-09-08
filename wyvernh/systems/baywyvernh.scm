(define-module (wyvernh systems baywyvernh)
  #:use-module (wyvernh modules home)
  #:use-module (wyvernh modules system)
  #:re-export (home os disk))

(home-config
 #:packages '(core wyvernh latex emacs engineering)
 #:services '())

(system-config
 #:hardware '(nvidia)
 #:filesystems '((fs-efi #:size "500M" #:type "vfat")
                 (fs-root #:size "20G" #:type "btrfs")
                 (fs-gnu #:size "100G" #:type "ext4")
                 (fs-swap #:size "18G")
                 (fs-other #:size "200G" #:type "ext4")
                 (fs-home #:size "600G" #:type "btrfs"))
 #:channels '(guix-science-nonfree))
