(define-module (wyvernh modules system groups)
  #:export (system-groups))

(define plugdev-group
  (user-group
   (name "plugdev")
   (system? #t)))

(define uinput-group
  (user-group
   (name "uinput")
   (system? #t)))

(lambda system-groups)
