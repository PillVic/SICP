#lang racket


(define (double f)
  (lambda (x) (f (f x))))

(define inc
  (lambda(x) (+ x 1)))

(((double (double double)) inc) 5)
