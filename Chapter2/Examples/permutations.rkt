#lang racket

(define nil null)
;;;;

(define (accumulate op initial sequence)
  (if [null? sequence]
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))


;;;;

(define (permutations s)
  (if [null? s]
      (list nil)
      (flatmap (lambda (x)
                 (map (lambda (p)
                        (cons x p))
                      (permutations (remove x s))))
               s)))

                 
(define (remove item sequence)
  (filter (lambda (x)
            (not (= x item)))
          sequence))



;;;;;;;test

(permutations (range 1 4))