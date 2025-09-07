(define-module (wyvernh modules system channels)
  #:use-module (guix channels)
  #:export (guix-science-nonfree))

(define-public %wyvernh-base-channels
  (cons* (channel
          (name 'mhguix)
          (url "https://github.com/WyvernH/mhguix"))
         (channel
          (name 'nonguix)
          (url "https://gitlab.com/nonguix/nonguix")
          (introduction
           (make-channel-introduction
            "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
            (openpgp-fingerprint
             "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
         %default-channels))

(define %guix-science-nonfree-channel
  (channel
   (name 'guix-science-nonfree)
   (url "https://codeberg.org/guix-science/guix-science-nonfree.git")
   (introduction
    (make-channel-introduction
     "58661b110325fd5d9b40e6f0177cc486a615817e"
     (openpgp-fingerprint
      "CA4F 8CF4 37D7 478F DA05  5FD4 4213 7701 1A37 8446"))))

(define guix-science-nonfree
  (list %guix-science-nonfree-channel))
