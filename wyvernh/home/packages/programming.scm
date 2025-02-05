(define-module (wyvernh home packages programming)
  #:use-module (gnu packages python)
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
