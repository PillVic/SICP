#lang sicp

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

;;;;;;;;;;test

(print-point (make-point 1 2))

(define (make-segment start end)
  (cons start end))

(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))

(define (midpoint-segment s)
  (make-point (/ (+ (x-point (start-segment s))
                    (x-point (end-segment s)))
                 2)
              (/ (+ (y-point (start-segment s))
                    (y-point (end-segment s)))
                 2)))
;;;;;test

(define p (make-point 1 2))
(define q (make-point 3 4))
(define s (make-segment p q))
(print-point (midpoint-segment s))