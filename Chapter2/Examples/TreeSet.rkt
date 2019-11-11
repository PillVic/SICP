#lang racket

;;implement set by using binary tree

;;basic method to operate the tree
(provide entry left-branch right-branch make-tree)

(define (entry tree)
  (car tree))

(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

;;out interface to operate the set
(provide element-of-set? adjoin-set)

(define (element-of-set? x set1)
  (cond ([null? set1] false)
        ([= x (entry set1)] true)
        ([< x (entry set1)]
         (element-of-set? x (left-branch set1)))
        ([> x (entry set1)]
         (element-of-set? x (right-branch set1)))))

(define (adjoin-set x set1)
  (cond ([null? set] (make-tree x `() `()))
        ([= x (entry set1)] set1)
        ([< x (entry set1)]
         (make-tree (entry set1)
                    (adjoin-set x (left-branch set1))
                    (right-branch set1)))
        ([> x (entry set1)]
         (make-tree (entry set1)
                    (left-branch set1)
                    (adjoin-set x (right-branch set1))))))

