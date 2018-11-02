#lang racket

(define (exp x n)
  (define square (lambda (x)
                   (* x x)))
  (define (even? x)
    (= (remainder x 2) 0))
  (define (exp-iter y n a)
    (if (= n 0)
        a
        (if (even? n)
            (exp-iter (square y) (/ n 2) a)
            (exp-iter y (- n 1) (* a y)))))
  (exp-iter x n 1))
    
    