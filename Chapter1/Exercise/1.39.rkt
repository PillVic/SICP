#lang sicp

;;;;;;;;;;iteration style

(#%provide pow)

(define (cont-frac-iter n d k)
  (define (iter t result)
    (if (> t 0)
        (iter (- t 1)
              (/ (n t) (+ result (d t))))
        result))
  (iter (- k 1) (/ (n k) (d k))))
;;;;;;;;;;;;recursive style
(define (cont-frac-recur n d k)
  (define (recur i)
    (if (= i k) (/ (n i) (d i))
        (/ (n i)
           (+ (d i) (recur (+ i 1))))))
  (recur 1))

(define cont-frac cont-frac-iter)

;;;;;;;;;;

(define (pow x a)
  (define (iter t x a)
    (cond ((= a 0) t)
          ((= (remainder a 2) 0) (iter t (* x x) (/ a 2)))
          (else (iter (* x t) x (- a 1)))))
  (iter 1 x a))

(define (tan-cf x k)
  (cont-frac (lambda(i) (if (= i 1) x (* -1 x x)))
             (lambda(i) (- (* 2 i) 1))
             k))
