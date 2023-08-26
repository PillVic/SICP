#lang sicp

(#%require "./2.7.rkt")

(#%provide sub-interval)

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
