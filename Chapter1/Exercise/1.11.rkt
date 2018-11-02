#lang racket

(define (f-recur n)
  (cond ((< n 3) n)
        (else (+ (f-recur (- n 1)) (* (f-recur (- n 2)) 2) (* (f-recur (- n 3)) 3)))))

(define (f n)
  (define (g c b a)
    (+ a (* b 2) (* 3 c)))
  (define (f-iter t a b c)
    (if (> t 2)
        (f-iter (- t 1) b c (g a b c))
        c))
  (if (< n 3)
      n
      (f-iter n 0 1 2)))
