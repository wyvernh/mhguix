(define-module (wyvernh home packages wyvernh)
  #:use-module (wyvernh packages cognition)
  #:use-module (wyvernh packages cogsh)
  #:export (%wyvernh-packages))

(define %wyvernh-packages
  (list cognition-0.3 cogsh))
