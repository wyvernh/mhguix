(define-module (wyvernh modules home)
  #:use-module (wyvernh modules tools)
  #:use-module (wyvernh modules home packages)
  #:use-module (wyvernh modules home services)
  #:export (home home-config))

(define default-packages '(core desktop wyvernh latex emacs engineering programming))
(define default-services '(desktop programming shepherd emacs))

(define home #f)

;; returns home so that it may be assigned to additional
;; home data structures corresponding to different users
(define home-config
  (lambda*
   (#:key (packages default-packages) (services default-services))
   (set! home (home-environment
               (packages (eval-reduce packages packages-environment))
               (services (eval-reduce services services-environment))))
   home))

(home-config)
