#lang sicp

(#%require "../Examples/listOp2.rkt")

(define (same-parity x . z)
  (filter (lambda (t) [= (remainder x 2) (remainder t 2)])
          (cons x z)))

(display (same-parity 1 2 3 4 5 6 7))
(newline)
