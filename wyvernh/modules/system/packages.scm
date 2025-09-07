(define-module (wyvernh modules system packages)
  #:use-module (gnu)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages version-control)
  #:export (packages-from))

(define core
  (list emacs-no-x-toolkit
        git))

(define extras
  (list bluez
        bluez-alsa
        brightnessctl
        kmonad
        ntfs-3g
        stow))

(define current-env (interaction-environment))

(define (groups-from lst)
  (append (eval-reduce lst current-env) %base-packages))
