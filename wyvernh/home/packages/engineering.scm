(define-module (wyvernh home packages engineering)
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages electronics)
  #:export (%wyvernh-engineering-packages))

(define %wyvernh-engineering-packages
  (list kicad
        freecad
        cura
        prusa-slicer
        xoscope))
