(define-module (wyvernh home packages desktop)
  #:use-module (gnu packages android)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gimp)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages libreoffice)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages kde)
  #:use-module (gnu packages image-viewers)
  #:use-module (gnu packages inkscape)
  #:use-module (gnu packages music)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages web)
  #:use-module (nongnu packages mozilla)
  #:export (%wyvernh-desktop-packages))

(define %wyvernh-desktop-packages
  (list musescore
        firefox
        alacritty
        pavucontrol
        libreoffice
        font-liberation
        font-gnu-freefont
        fontconfig
        gimp
        krita
        inkscape
        blender
        nsxiv
        qemu
        android-file-transfer
        cups
        gtk
        gtk+
        gtkdatabox
        qt5compat
        alsa-utils))
