(define-module (wyvernh modules system users)
  #:export (users-from))

(define (basic-user name #:optional full-name)
  (let base-user
      (user-account
       (name name)
       (group name)
       (shell (file-append zsh "/bin/zsh"))
       (supplementary-groups
        '("audio" "input" "kvm" "netdev" "plugdev" "users" "video" "wheel")))
    (if full-name
        (user-account (inherit base-user) (comment full-name))
        base-user)))

(define current-env (interaction-environment))

(define (users-from lst)
  (append (eval-map lst current-env) %base-users))
