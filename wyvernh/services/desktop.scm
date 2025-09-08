(define-module (wyvernh services desktop)
  #:use-module (gnu home services)
  #:use-module (gnu services)
  #:use-module (gnu services configuration)
  #:use-module (guix gexp))

(define (wyvernh-wayland-environment-service _)
  '(("QT_QPA_PLATFORM" . "wayland")
    ("MOZ_ENABLE_WAYLAND" . "1")
    ("SDL_VIDEODRIVER" . "wayland")
    ("XDG_SESSION_TYPE" . "wayland")))

(define-public wyvernh-wayland-service-type
  (service-type
   (name 'wyvernh-wayland-service)
   (extensions
    (list (service-extension home-environment-variables-service-type
                             wyvernh-wayland-environment-service)))
   (default-value #f)
   (description "Configure wayland.")))

(define (wyvernh-sway-environment _)
  '(("XDG_CURRENT_DESKTOP" . "sway")))

(define-public wyvernh-sway-service-type
  (service-type
   (name 'wyvernh-sway-service)
   (extensions
    (list (service-extension home-environment-variables-service-type
                             wyvernh-sway-environment)))
   (default-value #f)
   (description "Configure sway.")))
