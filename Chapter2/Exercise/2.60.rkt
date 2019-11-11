#lang racket

;; implement set which allow the repetition element exist

(provide element-of-set? adjoin-set union-set intersection-set)

(define (element-of-set? x set1)
  (cond ([null? set1] false)
        ([equal? x (car set1)] true)
        (else (element-of-set? x (cdr set1)))))

(define (adjoin-set x set1)
  (cons x set1))

(define (union-set set1 set2)
  (if [null? set2]
      set1
      (union-set (adjoin-set (car set2) set1)
                 (cdr set2))))

(define (intersection-set set1 set2)
  (cond ((or [null? set1] [null? set2])  `())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;;test

(define (test)
  (let ((s1 (list 1 2 3 3 4))
        (s2 (list 3 3 4 4 5 5 6)))
    (display (union-set s1 s2))
    (display (intersection-set s1 s2))))
