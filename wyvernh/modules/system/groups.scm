(define-module (wyvernh modules system groups)
  #:export (groups-from))

(define plugdev
  (user-group
   (name "plugdev")
   (system? #t)))

(define uinput
  (user-group
   (name "uinput")
   (system? #t)))

(define current-env (interaction-environment))

(define (groups-from lst)
  (append (eval-map lst current-env) %base-groups)
