(define-module (wyvernh home packages emacs)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages llvm)
  #:export (%wyvernh-emacs-packages))

(define %wyvernh-emacs-packages
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
        emacs-ligature
        emacs-doom-modeline
        emacs-ligature
        emacs-doom-modeline

        emacs-solaire-mode
        emacs-doom-themes
        emacs-rainbow-delimiters

        emacs-magit

        emacs-geiser

        emacs-guix

        emacs-vterm

        emacs-elfeed))
