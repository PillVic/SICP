#lang sicp

(define (reverse l)
  (define (iter l t)
    (if (null? l)
        t
        (iter (cdr l) (cons (car l) t))))
  (iter l nil))
             
(display (reverse `(1 2 3 4)))