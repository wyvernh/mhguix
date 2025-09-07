(define-module (wyvernh modules system packages)
  #:use-module (gnu)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages version-control)
  #:export (system-packages))

(define %system-packages-base
  (cons* ;bluez
         ;bluez-alsa
         ;brightnessctl
         emacs-no-x-toolkit
         git
         kmonad
         ;ntfs-3g
         ;stow
         %base-packages))

(lambda system-packages)
