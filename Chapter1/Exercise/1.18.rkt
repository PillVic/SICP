#lang racket
(define (product a b)
  (define (double a)
    (+ a a))
  (define (even? a)
    (= (remainder a 2) 0))
  (define (halve a)
    (/ a 2))
  (if (= a 1)
      b
      (if (even? a)
          (product (halve a) (double b))
          (product (- a 1) (+ b a)))))