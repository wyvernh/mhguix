(define-module (wyvernh modules system kernel-arg)
  #:export (kernel-arg-env))

(define intel '())
(define amd '())
(define nvidia '("modprobe.blacklist=nouveau"
                 "nvidia_drm.modeset=1"
                 "nvidia.NVreg_PreserveVideoMemoryAllocations=0"))
(define amdgpu '())

(define kernel-arg-env (interaction-environment))
