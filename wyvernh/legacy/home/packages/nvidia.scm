(define-module (wyvernh home packages nvidia)
  #:use-module (nongnu packages nvidia)
  #:export (wyvernh-nvidia-packages))

(define %wyvernh-nvidia-packages
  (list nvidia-htop))
