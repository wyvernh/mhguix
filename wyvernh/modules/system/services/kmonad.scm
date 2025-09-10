(define-module (wyvernh modules system services kmonad)
  ;#:use-module (wyvernh packages kmonad)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (guix gexp)
  #:export (kmonad-service))

(define kmonad-package-list
  (list kmonad))
;;        kmonad-config))

(define (kmonad-shepherd-service config-path)
  ;; Tells shepherd how we want it to create a (single) <shepherd-service>
  ;; for kmonad from a string
  (list (shepherd-service
          (documentation "Run the kmonad daemon (kmonad-daemon).")
          (provision '(kmonad-daemon))
          (requirement '(udev user-processes))
          (start #~(make-forkexec-constructor
                    (list #$(file-append kmonad "/bin/kmonad")
                          ;; TODO: replace with
                          ;; #$(file-append kmonad-config "/config.kbd"
                          ;; once a package for my kmonad config exists
                          #$config-path)))
          (stop #~(make-kill-destructor)))))

(define kmonad-service-type
  ;; Extend the shepherd root into a new type of service that takes a single string
  (service-type
   (name 'kmonad)
   (description
    "Run kmonad as a daemon.")
   (extensions
    (list (service-extension shepherd-root-service-type
                             kmonad-shepherd-service)
          (service-extension profile-service-type
                             kmonad-package-list)))))

(define (kmonad-service config-path)
  ;; Create a service from our service type, which takes a single parameter
  (service kmonad-service-type config-path))
