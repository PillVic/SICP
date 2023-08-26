#lang sicp

(#%require "./2.7.rkt")
(#%require "../Examples/interval-compute.rkt")

(#%provide div-interval)

(define (div-interval x y)
  (if [<= (* (- (lower-bound y) 0) (- (upper-bound y) 0)) ]
      (error "divide 0")
      (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))
