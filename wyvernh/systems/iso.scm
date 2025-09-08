(define-module (wyvernh system iso)
  #:use-module (wyvernh modules home)
  #:use-module (wyvernh modules system)
  #:export (home system disk))

(home-config
 #:packages '(core wyvernh)
 #:services '())

(system-config
 #:filesystems '((fs-efi #:size "100M") (fs-root #:size "1G"))
 #:users '((basic-user "iso"))
 #:groups '()
 #:channels '(guix-science-nonfree)
 #:packages '(core)
 #:services '((autologin "iso") 'base 'substitutes))
