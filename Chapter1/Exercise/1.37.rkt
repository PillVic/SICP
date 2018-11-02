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
;;;;;;;;;;;;;test
(cont-frac (lambda(i) 1.0)
           (lambda(i) 1.0)
           11)