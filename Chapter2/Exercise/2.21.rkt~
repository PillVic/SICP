#lang sicp

(define (same-parity x . z)
  (define (iter l r)
    (if (null? l)
        r
        (let ([r (cond ((= (remainder (- x (car l)) 2) 0) (cons r (car l)))
                       (else r))])
          (iter (cdr l) r))))
  (iter  z (list x)))

(display (same-parity 1 2 3 4 5 6 7))
