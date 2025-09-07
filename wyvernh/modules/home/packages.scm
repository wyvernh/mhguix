(define-module (wyvernh modules home packages)
  ;; for core packages
  #:use-module (gnu packages admin)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages patchutils)

  ;; for desktop packages
  #:use-module (gnu packages android)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gimp)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages hardware)
  #:use-module (gnu packages libreoffice)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages kde)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-viewers)
  #:use-module (gnu packages inkscape)
  #:use-module (gnu packages music)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (nongnu packages mozilla)

  ;; for emacs packages
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages llvm)

  ;; for engineering packages
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages electronics)

  ;; for latex packages
  #:use-module (gnu packages tex)
  #:use-module (gnu packages texlive)

  ;; for misc packages
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages astronomy)
  #:use-module (gnu packages plan9)

  ;; for nvidia packages
  #:use-module (nongnu packages nvidia)

  ;; for programming packages
  #:use-module (gnu packages base)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages m4)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages python)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages valgrind)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages embedded)

  ;; for wyvernh packages
  ;#:use-module (wyvernh packages cognition)
  ;#:use-module (wyvernh packages cogsh)

  #:export (packages-environment))

(define core
  (list htop
        neofetch
        zstd
        zip
        unzip
        openssh
        openssl
        arp-scan
        nano
        evtest
        colordiff))

(define desktop
  (list musescore
        firefox
        alacritty
        pavucontrol
        libreoffice
        font-fira-code
        font-liberation
        font-gnu-freefont
        fontconfig
        gimp
        ;krita
        ;inkscape
        ;blender
        nsxiv
        qemu
        android-file-transfer
        cups
        gtk
        gtk+
        gtkdatabox
        qt5compat
        alsa-utilssway
        swayidle
        swaylock
        fuzzel
        grim
        xdg-desktop-portal
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
        wtype
        font-hack
        playerctl
        waybar
        waybar-cpu-histogram
        xorg-server-xwayland))

(define emacs
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
        ;emacs-latex-extra
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
        ;emacs-ligature
        emacs-doom-modeline
        ;emacs-ligature
        emacs-doom-modeline

        emacs-solaire-mode
        emacs-doom-themes
        emacs-rainbow-delimiters

        emacs-magit

        emacs-geiser

        emacs-guix

        emacs-vterm

        emacs-elfeed))

(define engineering
  (list kicad
        freecad
        ;;cura
        prusa-slicer
        xoscope))

(define latex
  (list texlive-tex-gyre-math
        texlive-scheme-basic
        texlive-enumitem
        texlive-preprint
        texlive-anyfontsize
        texlive-diagbox
        texlive-pict2e
        texlive-pgf
        texlive-darkmode))

(define misc
  (list drawterm-wayland
        calceph
        fftw))

(define nvidia
  (list nvidia-htop))

(define programming
  (list perf
        valgrind
        python
        python-pyqt
        gnu-make
        cmake
        gcc-toolchain
        pkg-config
        m4
        rust
        ;rust-cargo
        ;(make-arm-none-eabi-toolchain-12.3.rel1)
  ))

(define wyvernh
  (list ;cognition-0.3 cogsh))
   ))

(define packages-environment (interaction-environment))
