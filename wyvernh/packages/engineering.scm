(define-module (wyvernh packages engineering)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system ant)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system qt)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix monads)
  #:use-module (guix packages)
  #:use-module (guix store)
  #:use-module (guix svn-download)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bdw-gc)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages c)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages code)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages dejagnu)
  #:use-module (gnu packages digest)
  #:use-module (gnu packages docbook)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages file)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages fpga)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gperf)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages groff)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages image-processing)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)               ;FIXME: for pcb
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages m4)
  #:use-module (gnu packages man)
  #:use-module (gnu packages markup)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages mpi)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages openkinect)
  #:use-module (gnu packages openkinect)
  #:use-module (gnu packages parallel)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pretty-print)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages sagemath)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages stb)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages tbb)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages time)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages toolkits)
  #:use-module (gnu packages tree-sitter)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wxwidgets)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module ((srfi srfi-1) #:hide (zip)))

(define-public libarcus
  (package
    (name "libarcus")
    (version "5.2.2") ; Should same version as Cura package.
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Ultimaker/libArcus")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "16vdjlfc4kk8a78siaw00sfxhwd8iigw3nfkfvis773s7sn0qd3b"))))
    (build-system cmake-build-system)
    (inputs
     (list protobuf
           python
           python-sip))
    (arguments
     `(#:tests? #f
       #:configure-flags '("-DBUILD_EXAMPLES=OFF")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-protobuf-compatibility
           (lambda _
             (substitute* "src/Socket_p.h"
               (("stream\\.SetTotalBytesLimit\\(message_size_maximum,.*\\);")
                "stream.SetTotalBytesLimit(message_size_maximum);"))))
         (add-before 'configure 'fix-python-sitearch
           (lambda* (#:key outputs #:allow-other-keys)
             (substitute* "cmake/FindSIP.cmake"
               (("\\$\\{_process_output\\} Python3_SITEARCH")
                (string-append (assoc-ref outputs "out")
                               "/lib/python"
                               ,(version-major+minor
                                 (package-version python))
                               "/site-packages"
                               " Python3_SITEARCH"))))))))
    (home-page "https://github.com/Ultimaker/libArcus")
    (synopsis "Communication library for Ultimaker software components")
    (description "This library contains C++ code and Python3 bindings for
creating a socket in a thread and using this socket to send and receive
messages based on the Protocol Buffers library.  It is designed to
facilitate the communication between Cura and its backend and similar code.")
    (license license:lgpl3+)))

(define-public cura-engine
  (package
    (name "cura-engine")
    (version "5.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
               (url "https://github.com/Ultimaker/CuraEngine")
               (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0xp250m5wwfsh9wdb3biqzvfqfz5jsmyw4bww93aksw0rgli07bp"))))
    (build-system cmake-build-system)
    (native-inputs
     (list googletest pkg-config))
    (inputs
     (list libarcus protobuf stb-image))
    (arguments
     `(#:configure-flags '("-DBUILD_TESTS=ON")
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-paths
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "../source/cmake/FindStb.cmake"
               (("/usr/include")
                (string-append (assoc-ref inputs "stb-image")
                               "/include"))
               (("stb/stb_image_resize.h")
                "stb_image.h"))
             (substitute*
                 "../source/src/infill/ImageBasedDensityProvider.cpp"
               (("stb/stb_image.h")
                "stb_image.h")))))))
    (home-page "https://github.com/Ultimaker/CuraEngine")
    (synopsis "Cura slicing engine")
    (description
     "CuraEngine is an engine for processing 3D models into 3D printing
instructions for Ultimaker and other GCode-based 3D printers.  It is part of a
larger project called Cura.")
    (license license:agpl3+)))

(define-public cura-binary-data
  (package
    (name "cura-binary-data")
    (version "5.9.0")
    (source
     (origin
       (method git-fetch)
         (uri (git-reference
               (url "https://github.com/Ultimaker/cura-binary-data")
               (commit version)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "11dra399adky7jxpaqqk11wrg5y3cc1086l54c3injg3ccgrvwik"))
         (modules '((guix build utils)))
         (snippet
          '(begin
             ;; Remove Windows executables and prebuilt firmware files.
             (delete-file-recursively "cura/resources/firmware")
             (delete-file-recursively "windows")))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f ; No test suite.
       #:configure-flags '("-DENABLE_FIRMWARE_INSTALL=OFF")))
    (home-page "https://github.com/Ultimaker/cura-binary-data")
    (synopsis "Binary data for Cura, like compiled translations")
    (description "This package contains binary data for Cura releases, like
compiled translations.  Prebuilt Firmware files are removed.")
    (license license:agpl3)))

;; (define-public udis86
;;   (let ((commit "5336633af70f3917760a6d441ff02d93477b0c86")
;;         (revision "0"))
;;     (package
;;       (name "udis86")
;;       (version (git-version "1.7.2" revision commit))
;;       (source (origin
;;                 (method git-fetch)
;;                 (uri (git-reference
;;                       (url "https://github.com/canihavesomecoffee/udis86")
;;                       (commit commit)))
;;                 (file-name (git-file-name name version))
;;                 (sha256
;;                  (base32
;;                   "0y5z1169wff578jylpafsww4px4y6gickhcs885a9c660d8xs9qy"))))
;;       (build-system gnu-build-system)
;;       (native-inputs (list autoconf automake libtool python-minimal-wrapper))
;;       ;; Fork of <https://github.com/vmt/udis86>.
;;       (home-page "https://github.com/canihavesomecoffee/udis86")
;;       (synopsis "Disassembler library for x86 and x86-64")
;;       (description
;;        "Udis86 is a disassembler for the x86 and x86-64 class of instruction
;; set architectures.  It consists of a C library called @code{libudis86} which
;; provides a clean and simple interface to decode and inspect a stream of raw
;; binary data as disassembled instructions in a structured manner, and a command
;; line tool called @command{udcli} that incorporates the library.")
;;       (license license:bsd-2))))

(define-public uranium
  (package
    (name "uranium")
    (version "5.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
               (url "https://github.com/Ultimaker/Uranium")
               (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1nyxm3fdyrsisqkxbqld66bljd852wnc1yc6i1lyvncwv3n8ai32"))))
    (build-system cmake-build-system)
    (native-inputs
     (list doxygen
           gettext-minimal
           graphviz
           pkg-config
           python-pytest
           python-mypy
           python-certifi
           python-twisted))
    (propagated-inputs
     (list cura-binary-data
           libarcus
           python
           python-cryptography
           python-numpy
           python-pyqt
           python-scipy
           python-shapely
           python-trimesh
           python-zeroconf
           qtbase
           qtdeclarative-5
           qtgraphicaleffects
           qtquickcontrols-5
           qtquickcontrols2-5
           qtsvg-5))
    (arguments
     `(;; FIXME: tests are disabled, because they cause an infinite loop.
       #:tests? #f
       #:configure-flags
       ,#~(list (string-append "-DGETTEXT_MSGINIT_EXECUTABLE="
                               #$(this-package-native-input "gettext-minimal")
                               "/bin/msginit")
                (string-append "-DCURA_BINARY_DATA_DIRECTORY="
                               #$(this-package-input "cura-binary-data")))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-uranium-plugin-path
           (lambda* (#:key outputs #:allow-other-keys)
             (substitute* "UM/Application.py"
               (("app_root =.*$")
                (string-append "app_root = \""
                               (assoc-ref outputs "out") "\"\n"))
               (("app_root, \"share\", \"uranium\", \"plugins\"")
                "app_root, \"lib\", \"uranium\", \"plugins\"")))))))
    (home-page "https://github.com/Ultimaker/Uranium")
    (synopsis "Python framework for building desktop applications")
    (description "Uranium is a Python Framework for building 3D printing
related desktop applications using PyQt5.  It belongs to the Cura project
from Ultimaker.")
    (license license:lgpl3+)))

(define-public libnest2d-for-cura
  ;; Cura uses a custom fork of the libnest2d library.
  (package
    (name "libnest2d-for-cura")
    (version "5.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Ultimaker/libnest2d")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1wk7cv8sqnxy7sr361scrr18dz2i0l4s4slmjfh4890iy0wf9i7n"))))
    (build-system cmake-build-system)
    (inputs
     (list boost clipper nlopt))
    (arguments
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'fix-clipper-detection
           (lambda* (#:key inputs #:allow-other-keys)
             (setenv "CLIPPER_PATH" (assoc-ref inputs "clipper")))))))
    (home-page "https://github.com/Ultimaker/libnest2d")
    (synopsis "2D irregular bin packaging and nesting library")
    (description
     "Libnest2D is a library and framework for the 2D bin packaging
problem.  It was inspired from the SVGNest Javascript library.")
    (license license:lgpl3)))

(define-public python-pynest2d
  (package
    (name "python-pynest2d")
    (version "5.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Ultimaker/pynest2d")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jhqfylg6vzl2z9rqs331bg6y8s18iklw1p8hmax72xq2c7561s1"))))
    (build-system cmake-build-system)
    (native-inputs
     (list pkg-config))
    (inputs
     (list boost
           clipper
           libnest2d-for-cura
           nlopt
           python
           python-sip))
    (arguments
     `(#:tests? #f
       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'fix-clipper-detection
           (lambda* (#:key inputs #:allow-other-keys)
             (setenv "CLIPPER_PATH" (assoc-ref inputs "clipper"))))
         (add-before 'configure 'fix-python-sitearch
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((path (string-append (assoc-ref outputs "out")
                                        "/lib/python"
                                        ,(version-major+minor
                                          (package-version python))
                                        "/site-packages")))
               (substitute* "cmake/FindSIP.cmake"
                 (("\\$\\{_process_output\\} Python3_SITEARCH")
                  (string-append path " Python3_SITEARCH"))
                 (("\\$\\{_process_output\\} Python3_SITELIB")
                  (string-append path " Python3_SITELIB")))))))))
    (home-page "https://github.com/Ultimaker/pynest2d")
    (synopsis "Python bindings for libnest2d")
    (description
     "This package contains CPython bindings for libnest2d-for-cura.")
    (license license:lgpl3+)))

(define-public libcharon
  (package
    (name "libcharon")
    (version "5.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
               (url "https://github.com/Ultimaker/libCharon")
               (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ibv15y7lfxs19k6rbc3kiaz13gq3v9vqxrk20rqp6bdclk3izff"))))
    (build-system cmake-build-system)
    (native-inputs
     (list python-pytest))
    (inputs
     (list python))
    (home-page "https://github.com/Ultimaker/libCharon")
    (synopsis "File metadata and streaming library")
    (description "LibCharon is a Python file metadata and streaming library.  It
belongs to the Cura project from Ultimaker.")
    (license license:lgpl3+)))

(define-public libsavitar
  (package
    (name "libsavitar")
    (version "5.3.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Ultimaker/libSavitar")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1cq85x0xizsjww9nl7v7x4i9vl335mgv2lda3q2c9fcwrndsc3wk"))))
    (build-system cmake-build-system)
    (inputs
     (list python python-sip))
    (arguments
     `(#:tests? #f ; No test suite.
       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'fix-python-sitearch
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((path (string-append (assoc-ref outputs "out")
                                        "/lib/python"
                                        ,(version-major+minor
                                          (package-version python))
                                        "/site-packages")))
               (substitute* "cmake/FindSIP.cmake"
                 (("\\$\\{_process_output\\} Python3_SITEARCH")
                  (string-append path " Python3_SITEARCH"))
                 (("\\$\\{_process_output\\} Python3_SITELIB")
                  (string-append path " Python3_SITELIB")))))))))
    (home-page "https://github.com/Ultimaker/libSavitar")
    (synopsis "C++ implementation of 3mf loading with SIP python bindings")
    (description "LibSavitar is a C++ implementation of 3mf loading with SIP
python bindings.  It belongs to the Cura project from Ultimaker.")
    (license license:lgpl3+)))

(define-public cura
  (package
    (name "cura")
    (version "5.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Ultimaker/Cura")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0yg17pcrj5gmm2aqcjfk40ynvpb9r9aaq9rj108dkpki1is15ks7"))))
    (build-system qt-build-system)
    (native-inputs
     (list python-certifi
           python-mypy
           python-pytest
           python-requests))
    (inputs
     (list bash-minimal
           cura-engine
           libcharon
           libsavitar
           python
           python-keyring
           python-pynest2d
           python-pyserial
           python-sentry-sdk
           python-sip
           uranium))
    (arguments
     `(;; TODO: Fix tests.
       #:tests? #f
       #:configure-flags '("-DURANIUM_SCRIPTS_DIR=")
       #:phases
       (modify-phases %standard-phases
         (add-after 'install 'link-to-CuraEngine
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (symlink (string-append (assoc-ref inputs "cura-engine")
                                     "/bin/CuraEngine")
                      (string-append (assoc-ref outputs "out")
                                     "/bin/CuraEngine"))))
         (add-after 'link-to-CuraEngine 'wrap-pythonpath
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (wrap-program (string-append out "/bin/cura")
                 (list "GUIX_PYTHONPATH"
                       'prefix (list (string-append out
                                                    "/lib/python"
                                                    ,(version-major+minor
                                                      (package-version python))
                                                    "/site-packages")
                                     (getenv "GUIX_PYTHONPATH"))))))))))
    (home-page "https://github.com/Ultimaker/Cura")
    (synopsis "Slicer for 3D printers")
    (description "Cura is a slicing software from Ultimaker.  A @emph{slicer}
generates G-Code for 3D printers.")
    (license license:lgpl3+)))

libarcus
