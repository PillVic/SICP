#lang sicp
;;;a recursive style
(define (product a next b term)
  (define (recur t )
    (cond ((> t b) 1)
          (else (* (term t)
                   (recur (next t))))))
  (recur a))
;;;;;;b iteration style
(define (pdt a next b term)
  (define (iter t r)
    (cond ((> t b) r)
          (else (iter (next t) (* r (term t))))))
  (iter a 1))

(define (square x)
  (* x x))

(define (inc n)
  (+ n 1))

(define (cal-pi n)
  (define (term x)
    (square (/ (* 2 x) (+ 1 (* x 2)))))
  (* 2 (pdt 1 inc n term) (* 2 (+ n 1))))

(cal-pi 100000)