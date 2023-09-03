#lang sicp
(#%require "../Examples/Set.rkt")

(define (union-set s1 s2)
  (cond ([null? s2] s1)
        ([element-of-set? (car s2) s1] (union-set s1 (cdr s2)))
        (else (union-set (cons (car s2) s1) (cdr s2)))))


;;test
(define test
  (lambda ()
    (let ((s1 (list 1 2 3 4))
          (s2 (list 3 4 5 6)))
      (display (union-set s1 s2)))))

