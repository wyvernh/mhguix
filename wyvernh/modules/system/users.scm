(define-module (wyvernh modules system users)
  #:use-module (wyvernh modules tools)
  #:use-module (gnu)
  #:use-module (gnu packages shells)
  #:use-module (srfi srfi-1)
  #:export (users-from groups-from))

(define (build-user name full-name group gps)
  (let ((base-user
         (user-account
          (name name)
          (group group)
          (supplementary-groups gps))))
    (if full-name
        (user-account (inherit base-user) (comment full-name))
        base-user)))

(define* (basic-user name #:optional full-name)
  (build-user name full-name "users" '("audio" "users" "wheel")))

(define* (desktop-user name #:optional full-name)
  (build-user name full-name name '("audio" "input" "kvm" "netdev" "plugdev" "users" "video" "wheel")))

(define plugdev
  (user-group
   (name "plugdev")
   (system? #t)))

(define uinput
  (user-group
   (name "uinput")
   (system? #t)))

(define current-env (interaction-environment))

(define (users-from lst)
  (append (eval-map lst current-env) %base-user-accounts))

(define (user->group user)
  (user-group (name (user-account-group user))))

(define (user-groups users)
  (map user->group (users-from users)))

(define (groups-from groups users)
  (delete-duplicates
   (append %base-groups (eval-map groups current-env) (user-groups users))
   (lambda (gp1 gp2) (string=? (user-group-name gp1) (user-group-name gp2)))))
