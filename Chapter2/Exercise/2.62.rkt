#lang racket

(require "../Examples/SortedSet.rkt")
(require "./2.61.rkt")

(provide union-set)

;base on the previous exercise
(define (union-set s1 s2)
  (if [null? s2]
      s1
      (union-set (adjoin-set (car s2)
                             s1)
                 (cdr s2))))

;;answer on the net

(define (union-set2 set1 another)
  (cond ((and [null? set1] [null? another]) `())
        ([null? set1] another)
        ([null? another] set1)
        (else
         (let ([x (car set1)]
               [y (car another)])
           (cond ([= x y]
                  (cons x  (union-set (cdr set1) (cdr another))))
                 ([< x y]
                  (cons x (union-set (cdr set1) another)))
                 ([> x y]
                  (cons y (union-set set1 (cdr another)))))))))


(define (test)
  (let ([s1 (list 1 2 3 4)]
        [s2 (list 3 4 5 6)])
    (display (union-set s1 s2))))
