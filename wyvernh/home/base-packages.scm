(define-module (wyvernh home base-packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages music)
  #:use-module (gnu packages rust)
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
  emacs-ob-async

  emacs-auctex
  emacs-latex-preview-pane
  emacs-latex-extra
  emacs-cdlatex

  emacs-lsp-mode
  emacs-lsp-treemacs
  emacs-lsp-ui

  emacs-cmake-mode

  emacs-csv-mode
  emacs-gnuplot
  emacs-cc-mode
  emacs-clang-format
  emacs-rustic
  rust-analyzer
  emacs-ligature
  emacs-doom-modeline

  emacs-solaire-mode
  emacs-doom-themes
  emacs-rainbow-delimiters

  font-fira-code

  emacs-magit

  emacs-geiser

  emacs-guix

  emacs-vterm

  emacs-elfeed

  kicad
  musescore

  firefox
  cognition
  htop
  nvidia-htop))
