(define-module (wyvernh modules system firmware)
  #:export (firmware-env))

(define intel '())
(define amd '())
(define nvidia '("modprobe.blacklist=nouveau"
                 "nvidia_drm.modeset=1"
                 "nvidia.NVreg_PreserveVideoMemoryAllocations=0"))
(define amdgpu '())
(define linux-firmware (list (@ (nongnu packages linux) linux-firmware)))

(define firmware-env (interaction-environment))
