(define-module (wyvernh home packages latex)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages texlive)
  #:export (%wyvernh-latex-packages))

(define %wyvernh-latex-packages
  (list texlive-tex-gyre-math
        texlive-scheme-basic
        texlive-enumitem
        texlive-preprint
        texlive-anyfontsize
        texlive-diagbox
        texlive-pict2e
        texlive-pgf
        texlive-darkmode))
