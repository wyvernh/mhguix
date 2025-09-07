(define-module (wyvernh home packages core)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages patchutils)
  #:export (%wyvernh-core-packages))

(define %wyvernh-core-packages
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
