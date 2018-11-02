#lang sicp

(define (even? n)
  (= (remainder n 2) 0))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k)
    (f (+ a (* k h))))
  (define (s-iter n step t)
    (cond ((= step n) t)
          ((even? step)
           (s-iter n (+ step 1) (+ t (* 2 (y step)))))
          (else
           (s-iter n (+ step 1) (+ t (* 4 (y step)))))))
  (* (/ h 3) (+ (y 0) (y n) (s-iter n 1 0))))

(define (cube x)
  (* x x x))

(simpson cube 0 1 100)