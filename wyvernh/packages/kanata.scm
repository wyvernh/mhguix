(define-module (wyvernh packages kanata)
  #:use-module (guix)
  #:use-module (guix build-system cargo)
  #:use-module (guix licenses)
  #:use-module (gnu packages)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages python))

(define-public kanata
  (package
   (name "kanata")
   (version "1.9.0")
   (source (origin
            (method url-fetch)
            (uri (string-append "https://github.com/jtroo/kanata/archive/v"
                                version ".tar.gz"))
            (sha256
             (base32 "1dil3kvmhfy0dwrrdyb7w12w5diss8j3m3r853119bhpfd6fsjvm"))))

   (build-system cargo-build-system)
   (arguments
    `(#:features '("cmd")
      #:cargo-build-flags '("--release")))
   (inputs
    `(("libevdev" ,libevdev)
      ("python-libevdev" ,python-libevdev)
    ;  ("libinput" ,libinput)
      ("python" ,python)))
   (home-page "https://github.com/jtroo/kanata")
   (synopsis "A keyboard remapper for Linux")
   (description
    "Kanata is a keyboard remapping utility for Linux with a focus on usability,
advanced customization, and cross-platform support.")
   (license lgpl3+)))

kanata
