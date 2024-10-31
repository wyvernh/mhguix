(define-module (wyvernh home emacs)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu packages emacs)
  #:use-module (gnu services)
  #:use-module (guix gexp)
  #:export (home-emacs-server-service-type))

(define (emacs-server-shepherd-service config)
  (list (shepherd-service
         (documentation "Emacs server.")
         (provision '(emacs-server))
         (start #~(make-forkexec-constructor
                   (list #$(file-append emacs "/bin/emacs")
                         "--fg-daemon")))
         (stop #~(make-kill-destructor)))))

(define home-emacs-server-service-type
  (service-type
   (name 'home-emacs-server)
   (extensions (list (service-extension home-shepherd-service-type
                                        emacs-server-shepherd-service)))
   (default-value #f)
   (description "Run Emacs in server mode.")))
