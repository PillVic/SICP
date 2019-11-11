#lang racket

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define compose
  (lambda (f g)
    (lambda (x)
      (f (g x)))))

(define (repeate f time)
  (define (iter t f time)
    (cond ((= time 0) t)
          ((= (remainder time 2) 0)
           (iter t (compose f f) (/ time 2)))
          (else
           (iter (compose t f) f (- time 1)))))
  (iter (lambda (x) x) f time))

;;;;;;condition




