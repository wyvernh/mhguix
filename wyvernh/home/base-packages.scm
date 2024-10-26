(define-module (wyvernh home base-packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages web)
  #:use-module (nongnu packages mozilla)
  #:use-module (nongnu packages nvidia)
  #:use-module (wyvernh packages cognition)
  #:export (%wyvernh-base-packages))

(define %wyvernh-base-packages
  (list emacs-next-pgtk
	emacs-general
	emacs-which-key
	emacs-hydra

	emacs-org
	emacs-org-modern
	emacs-org-pomodoro
	emacs-org-make-toc
	emacs-org-present
	emacs-org-roam
	emacs-org-appear
	emacs-org-ql

	emacs-magit

	emacs-geiser

	emacs-guix

	emacs-vterm

	emacs-elfeed
	
	firefox
	cognition
	htop
	nvidia-htop))
