#lang racket

;;;;recursive style
(define (accumulate-recur combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-recur combiner null-value term (next a) next b))))

;;;;;;;;iteration style
(define (accumulate-iter combiner null-value term a next b)
  (if (> a b)
      null-value
      (accumulate-iter combiner
                       (combiner null-value (term a))
                       term
                       (next a)
                       next
                       b)))
  

;;;;;;;below is the test example

(define (sum a next b term)
  (accumulate-iter + 0 term a next b))

(define (f x)
  x)
(define (inc n)
  (+ n 1))

(sum 1 inc 100 f)

(define (product a next b term)
  (accumulate-iter * 1 term a next b))

(product 1 inc 5 f)