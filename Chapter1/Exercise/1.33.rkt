#lang sicp

(define (square x)
  (* x x))

(define (prime? n)
  (define (smallest-divisor n)
    (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (divides? a b)
    (= (remainder b a) 0))
  (= n (smallest-divisor n)))
;;;;;;over is the condition

;;;;;;;;iteration style
(define (filtered-accumulate filter combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((filter a)
         (filtered-accumulate filter
                              combiner
                              (combiner null-value (term a))
                              term
                              (next a)
                              next
                              b))
        (else (filtered-accumulate filter
                                   combiner
                                   null-value
                                   term
                                   (next a)
                                   next
                                   b))))
  

;;;;;;;a)


(define (f x)
  x)

(define (inc n)
  (+ n 1))

(define (prime-sum a b)
  (filtered-accumulate prime? + 0 f a inc b))
;;;;;;;b)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (relative-prime a b)
  (= (gcd a b) 1))
(define (cal-rela-prime-sum n)
  (define (test t)
    (relative-prime t n))
  (filtered-accumulate test * 1 f 1 inc n))

(cal-rela-prime-sum 8)
;;;;;;;;;

  
