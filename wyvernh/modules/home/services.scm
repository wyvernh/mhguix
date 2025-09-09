(define-module (wyvernh modules home services)
  #:use-module (wyvernh modules home services desktop)
  #:use-module (wyvernh modules home services emacs)
  #:use-module (gnu home services)
  #:use-module (gnu home services desktop)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu home services sound)
  #:export (services-environment))

(define desktop
  (list (service home-dbus-service-type)
        (service home-pipewire-service-type)
        (service wyvernh-sway-service-type)
        (service wyvernh-wayland-service-type)))

(define emacs
  (list (service home-emacs-server-service-type)))

(define shepherd
  (list (service home-shepherd-service-type)))

(define programming
  (list (simple-service 'env-vars-service
                        home-environment-variables-service-type
                        `(("PATH" . "$PATH:$HOME/.cargo/bin")))))

(define services-environment (interaction-environment))
