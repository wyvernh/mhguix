(define-module (wyvernh modules tools)
  #:export (eval-reduce))

(define (eval-reduce elist environment)
  (reduce append '() (map (lambda (datum) (eval datum environment)) elist)))
