(define-module (wyvernh modules home services)
  #:use-module (wyvernh services desktop)
  #:use-module (wyvernh services emacs)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:export (services-environment))

(define desktop
  (list (service home-dbus-service-type)
        (service home-pipewire-service-type)
        (service wyvernh-sway-service-type)
        (service wyvernh-wayland-service-type)))

(define emacs
  (list (service home-emacs-server-service-type)))

(define shepherd
  (list (service home-shepherd-servicetype)))

(define programming
  (list (simple-service 'env-vars-service
                        home-environment-variables-service-type
                        `(("PATH" . "$PATH:$HOME/.cargo/bin")))

(define services-enviroment (interaction-environment))
