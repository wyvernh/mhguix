(define-module (wyvernh modules tools)
  #:use-module (srfi srfi-1))

(define-public (eval-map lst environment)
  (map (lambda (datum) (eval datum environment)) lst))

(define-public (eval-reduce lst environment)
  (fold append '() (eval-map lst environment)))

(define-public (remove-false lst)
  (filter (lambda (e) e) lst))
