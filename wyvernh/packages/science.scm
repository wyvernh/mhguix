(define-module (wyvernh packages science)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages ruby)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu))

(define-public form
  (let ((commit "9b0d11c594628b64f9f8298c2ddb98b8a6447cbe")
        (revision "0"))
    (package
     (name "form")
     (version (git-version "5.0.0" revision commit))
     (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/form-dev/form")
                    (commit commit)
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1zfbrs5awia1li9bb1apcc6y492crrfzc56r0n9cakrgil9qxkwr"))))
     (build-system gnu-build-system)
     (arguments
      (list #:configure-flags
            #~'("--enable-native=no")
            #:phases
            #~(modify-phases
               %standard-phases
               (add-after 'unpack 'patch-src
                          (lambda _
                            (substitute* "check/examples.frm"
                                         ;; skip test that causes memory leak and fails
                                         (("#pend_if valgrind\\?")
                                          "#pend_if 0"))
                            (substitute* "sources/extcmd.c"
                                         (("/bin/sh")
                                          (string-append
                                           #$(this-package-input "bash-minimal")
                                           "/bin/sh")))))
               (add-after 'build 'build-doxygen
                          (lambda _
                            (with-directory-excursion "doc/doxygen"
                                                      (invoke "make" "html"))))
               (add-after 'install 'install-docs
                          (lambda _
                            (let ((doc (string-append
                                        #$output "/share/doc/" #$name "-"
                                        #$version "/html")))
                              (mkdir-p doc)
                              (copy-recursively "doc/doxygen/html" doc)))))))
     (native-inputs (list autoconf automake doxygen ruby))
     (inputs (list bash-minimal gmp mpfr zstd zlib flint))
     (home-page "https://www.nikhef.nl/~form/")
     (synopsis "Symbolic manipulation system for very big expressions")
     (description
      "FORM is a symbolic manipulation system.  It reads symbolic expressions
from files and executes symbolic/algebraic transformations upon them.  The
answers are returned in a textual mathematical representation.  The size of
the considered expressions in FORM is only limited by the available disk space
and not by the available RAM.")
     ;; XXX: Ignore this CVE to work around a name clash with the unrelated
     ;; "neos/forms" package.
     (properties '((lint-hidden-cve . ("CVE-2021-32697"))))
     ;; x86_64 only due to test failures on other platforms.
     ;; Developers say other platforms are not "tier 1" supported:
     ;; https://github.com/form-dev/form/issues/426
     (supported-systems '("x86_64-linux"))
     (license license:gpl3+))))
