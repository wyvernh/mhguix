(define-module (wyvernh packages configuration)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (guix build-system copy))

(define-public kmonad-config
  (package
   (name "kmonad-config")
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
    `(#:install-plan `(("config/kmonad/config.kbd" "share/kmonad/baywyvernh.kbd"))))
   (synopsis "A keyboard layout for kmonad.")
   (description "This package contains a keyboard layout so that the kmonad shepherd
service can install and run kmonad as well as its configuration.")
   (home-page "https://github.com/wyvernh/constellation")
   (license expat)))

(define-public emacs-config
  (package
   (name "emacs-config")
   (version "0.1.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/wyvernh/constellation.git")
           (commit "72df283fdd2348a2bc98ff0a1f47174ea4105497")))
     (sha256
      (base32
       "0dy7kam835l2znqpapm0gc5by4bx513r3wmznvmca0rp8679889j"))))
   (build-system copy-build-system)
   (arguments
    `(#:install-plan `(("config/emacs/init.el" "config/emacs/init.el"))))
   (synopsis "An emacs configuration.")
   (description "This package provides an emacs configuration that can be linked to the
$HOME/.config/emacs directory by a home service.")
   (home-page "https://github.com/wyvernh/constellation")
   (license expat)))
