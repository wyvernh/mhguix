(define-module (wyvernh modules system kernel-lm)
  #:export (kernel-lm-env))

(define intel '())
(define amd '())
(define nvidia '())
(define amdgpu '())

(define kernel-lm-env (interaction-environment))
