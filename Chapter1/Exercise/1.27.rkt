#lang sicp

(define even? (lambda (x)
                (= (remainder x 2) 0)))

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fertest n)
  (define (try-it start a)
    (cond ((= start a) true)
          ((= (expmod start a a) start) (try-it (+ start 1) a))
          (else false)))
  (try-it 1 n))
          

         