#lang racket

(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))
  
(define (expmod base exp m)
  (define (em t base exp m)
    (cond ((= 0 exp) (remainder t m))
          
          ((even? exp)
           (em t (remainder (square base) m) (/ exp 2) m))
          (else
           (em (remainder (* t base) m) base (- exp 1) m))))
  (em 1 base exp m))
  
;;;over is the condition on the text

(define (miller-rabin n)
  (= (expmod (random 1 (- n 1)) (- n 1) n) 1)) 
