#lang racket

;;implement set as unsorted list

(provide element-of-set? adjoin-set intersection-set)

;;judge whether the element is in the set or not
(define (element-of-set? x set1)
  (cond ([null? set1] false)
        ([equal? x (car set1)] true)
        (else (element-of-set? x (cdr set1)))))

;;return a set which include all the element in the set and x
(define (adjoin-set x set1)
  (if (element-of-set? x set1)
      set1
      (cons x set1)))

;;calculate the intersection of the two sets
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) `())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
         (else (intersection-set (cdr set1) set2))))

