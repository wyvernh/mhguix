(define-module (wyvernh packages utils)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages disk)
  #:use-module (guix build-system copy))

(define-public mhdisk
  (package
   (name "mhdisk")
   (version "0.1.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/wyvernh/constellation.git")
           (commit "05d855dc28d307a71f9000a465d8b5c7d0597f0b")))
     (sha256
      (base32
       "0gnlkqqscd062453fqx6ssyr9cx6wl6zva2480m7n26726rl6alw"))))
   (build-system copy-build-system)
   (arguments
    `(#:install-plan `(("utils/mhdisk/bin" "bin")
                       ("utils/mhdisk/src" "src"))))
   (inputs (list gptfdisk))
   (synopsis "A disk auto-partitioning tool for Guix system configurations.")
   (description "Automatically partition a disk according to a configuration generated
using the MHGuix configuration system.")
   (home-page "https://github.com/wyvernh/constellation")
   (license expat)))

(define-public guix-installer
  (package
   (name "guix-installer")
   (version "0.1.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/wyvernh/constellation.git")
           (commit "a6853fb8a0c365cf911b390d10c1a038464727c3")))
     (sha256
      (base32
       "1995hx2cajd1ajk55jfpg0psapplmc5yf7h0qzfiqma1jlnp5gld"))))
   (build-system copy-build-system)
   (arguments
    `(#:install-plan `(("utils/guix-installer/bin" "bin"))))
   (inputs (list mhdisk))
   (synopsis "Install a complete OS from an mhguix config.")
   (description "Automates the installation process for a Guix system using mhguix and
mhdisk.")
   (home-page "https://github.com/wyvernh/constellation")
   (license expat)))

(define-public mhguix-scripts
  (package
   (name "mhguix-scripts")
   (version "0.1.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/wyvernh/constellation.git")
           (commit "a6853fb8a0c365cf911b390d10c1a038464727c3")))
     (sha256
      (base32
       "1995hx2cajd1ajk55jfpg0psapplmc5yf7h0qzfiqma1jlnp5gld"))))
   (build-system copy-build-system)
   (arguments
    `(#:install-plan `(("utils/mhguix-scripts/bin" "bin"))))
   (synopsis "Manage an mhguix operating system.")
   (description "Automates processes such as updating channels and reconfiguring the
system.")
   (home-page "https://github.com/wyvernh/constellation")
   (license expat)))
