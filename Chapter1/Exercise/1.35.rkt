#lang sicp

(define (cal-phi n)
  (define (cal-iter x t)
    (if (> t n)
        x
        (cal-iter (+ 1 (/ 1 x)) (+ t 1))))
  (cal-iter 1 0))

(cal-phi 100)