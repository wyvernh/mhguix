(define-module (wyvernh packages misc)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix licenses)
  #:use-module (guix build-system copy))

(define-public gum
  (package
   (name "gum")
   (version "0.14.1")
   (source
    (origin
     (method url-fetch)
     (uri (string-append "https://github.com/charmbracelet/gum/releases/download/v"
                         version "/gum_" version "_Linux_x86_64.tar.gz"))
     (sha256
      (base32
       "17qarjv676amz1s4d1la15dr3gas0swxrzdaaspabid5amspw9kv")))) ; Replace with actual hash
   (build-system copy-build-system)
   (arguments
    '(#:install-plan '(("gum" "bin/gum"))))
   (home-page "https://github.com/charmbracelet/gum")
   (synopsis "A tool for glamorous shell scripts")
   (description "Gum provides utilities for interactive shell scripts.")
   (license expat)))
