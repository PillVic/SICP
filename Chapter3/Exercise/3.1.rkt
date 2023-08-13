#lang sicp

(define (make-accumulator x)
  (lambda (s)
    (set! x (+ x s))
    x))


(define A (make-accumulator 5))
(A 10)
(A 10)
