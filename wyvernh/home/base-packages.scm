(define-module (wyvernh home base-packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages web)
  #:use-module (nongnu packages mozilla)
  #:use-module (nongnu packages nvidia)
  #:use-module (wyvernh packages cognition)
  #:export (%wyvernh-base-packages))

(define %wyvernh-base-packages
  (list emacs-next-pgtk
	firefox
	cognition
	htop
	nvidia-htop))
