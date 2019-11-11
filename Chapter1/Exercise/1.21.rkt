#lang racket
(define (smallest-divisor x)
  (define (sd-iter x n)
    (if (= (remainder x n) 0)
        n
        (sd-iter x (+ n 1))))
  (if (= x 1)
      1
      (sd-iter x 2)))