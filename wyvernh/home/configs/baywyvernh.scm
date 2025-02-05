(define-module (wyvernh home configs baywyvernh)
  #:use-module (gnu home)
  #:use-module (gnu services)
  #:use-module (wyvernh home packages latex)
  #:use-module (wyvernh home packages emacs)
  #:use-module (wyvernh home packages engineering)
  #:use-module (wyvernh home packages programming)
  #:use-module (wyvernh home packages desktop)
  #:use-module (wyvernh home packages misc)
  #:use-module (wyvernh home packages core)
  #:use-module (wyvernh home packages nvidia)
  #:use-module (wyvernh home packages wyvernh)
  #:use-module (wyvernh home services)
  #:use-module (wyvernh home sway)
  #:use-module (wyvernh home waybar)
  #:export (baywyvernh-home-environment))

(define %baywyvernh-packages
  (append ;;%wyvernh-packages
          %wyvernh-latex-packages))
          ;;%wyvernh-nvidia-packages
          ;;%wyvernh-core-packages
          ;;%wyvernh-emacs-packages
          ;;%wyvernh-engineering-packages
          ;;%wyvernh-programming-packages
          ;;%wyvernh-desktop-packages
   ;;%wyvernh-package-module-latex))
   ;;%wyvernh-test-packages))
;;(list))

(define baywyvernh-home-environment
  (home-environment
   (packages %baywyvernh-packages)
   (services
    (modify-services
     %wyvernh-home-services
     (wyvernh-sway-service-type
      config => (wyvernh-sway-configuration
                 (machine "baywyvernh")))
     (wyvernh-waybar-service-type
      config => (wyvernh-waybar-configuration
                 (machine "baywyvernh")
                 (font-size "20px")))))))

baywyvernh-home-environment
