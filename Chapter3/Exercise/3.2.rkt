#lang sicp

(define (make-monitored f)
  (define t 0)
  (define (how-many-calls?) t)
  (lambda (x)
    (if [eq? x 'how-many-calls?]
        (how-many-calls?)
        (begin (set! t (+ t 1))
               (f x)))))


(define A (make-monitored sqrt))

(A 100)
(A 25)
(A 'how-many-calls?)
