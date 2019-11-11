#lang sicp

(define zero
  (lambda (f)
    (lambda (x) x)))

(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))
;;;;;;;condition

(define one
  (lambda (f)
    (lambda (x)
      (f x))))

(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

(define +
  (lambda (m n)
    (lambda (f)
      (lambda (x)
        ((m f) ((n f) x))))))
;;;;;;;;;;;;;;;test

(define inc
  (lambda (x)
    (- x 1)))

(define three (+ one two))
(and (= ((three inc) 0) -3) (= ((one dec) 0) -1) (= ((two dec) 0) -2))


