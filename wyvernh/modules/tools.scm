(define-module (wyvernh modules tools))

(define-public (eval-map lst environment)
  (map (lambda (datum) (eval datum environment)) lst))

(define-public (eval-reduce lst environment)
  (fold append '() (eval-map lst)))

(define-public (remove-false lst)
  (remove (lambda (e) e) lst))
