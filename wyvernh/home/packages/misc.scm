(define-module (wyvernh home packages misc)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages astronomy)
  #:use-module (gnu packages plan9)
  #:export (%wyvernh-misc-packages))

(define %wyvernh-misc-packages
  (list drawterm-wayland
        calceph
        fftw))
