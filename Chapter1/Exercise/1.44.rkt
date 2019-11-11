#lang racket


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
;;;;;;;;;

(define dx 0.00001)

;;;;;;;condition

(define smooth
  (lambda(f)
    (lambda (x)
      (/ (+ (f x) (f (- x dx)) (f (+ x dx)))
         3))))

;;;;;;test
(define square
  (lambda (x)
    (* x x)))

((smooth square) 5)


;;;;;;;
(define (smooth-n-times-iter f n)
  (if (= n 0)
      f
      (smooth-n-times (smooth f) (- n 1))))

(define (smooth-n-times f n)
  ((repeate smooth n) f))

;;;;;test

((smooth-n-times square 10) 5)


