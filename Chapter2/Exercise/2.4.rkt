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

;;;;;;;;;;;;;;;;;;;;;;condition
(define (square x)
  (* x x))

(define (make-rect-point p q)
  (cons p q))

(define (cal-len-segment rect)
  (cons (abs (- (x-point (car rect))
                (x-point (cdr rect))))
        (abs (- (y-point (car rect))
                (y-point (cdr rect))))))

(define (cal-area rect)
  (* (car (cal-len rect))
     (cdr (cal-len rect))))

(define (cal-perimeter rect)
  (* (+ (car (cal-len rect))
        (cdr (cal-len rect)))
     2))

;;;;;;;;;;;;;;;;;;;;another solution

(define (make-rect-segment s1 s2)
  (cons s1 s2))

(define (cal-len-segment rect)
  (cons (abs (- (x-point (start-segment s1))
                (x-point (end-segment s1))))
        (abs (- (y-point (start-segment s2))
                (y-point (end-segment s2))))))
                         


;;;;;test
(define q (make-point 1 2))
(define p (make-point 3 4))

(define rect (make-rect p q))

(display (cal-area rect))
(newline)
(display (cal-perimeter rect))




