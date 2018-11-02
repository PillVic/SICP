#lang sicp

;;;;;;;;;;iteration style

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

(define cont-frac cont-frac-recur)

;;;;;;;;;;

(define (d k)
  (if (= (remainder k 3) 2)
      (/ (+ k k 2) 3)
      1))

(define (cal-e k)
  (define (N i)
    1)
  (+ 2 (cont-frac N d k)))


           