(define-module (wyvernh home packages programming)
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
  #:export (%wyvernh-programming-packages))

(define %wyvernh-programming-packages
  (list perf
        valgrind
        python
        python-pyqt
        make
        cmake
        gcc-toolchain
        pkg-config
        m4
        rust
        rust-cargo))
