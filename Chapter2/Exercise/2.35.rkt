#lang racket

(define (accumulate op initial sequence)
  (if [null? sequence]
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
;;;;;

(define (count-leaves t)
  (accumulate 
;;;;;;;;;;test

(define x `((1 2) 3 4))
(count-leaves x)