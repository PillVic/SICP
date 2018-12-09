#lang sicp

(define atom?
  (lambda (x)
    (not (pair? x))))
            
(define equal
  (lambda (x y)
    (cond ((and [atom? x] [atom? y])
           (eq? x y))
          ((or [atom? x] [atom? y])
           false)
          (else
           (and [eq? (car x) (car y)]
                [equal (cdr x) (cdr y)])))))

(equal `(1 2 3) `(1 3 2))