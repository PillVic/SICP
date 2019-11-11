#lang racket
(define (get x y)
  (if (or (<= x 1) (<= y 1) (= x y))
      1
      (+ (get (- x 1) (- y 1)) (get (- x 1) y))))