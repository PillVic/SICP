#lang sicp


(#%provide upper-bound lower-bound make-interval)


(define (make-interval a b)
  (cons a b))

(define (upper-bound p)
  (if (> (car p) (cdr p))
      (car p)
      (cdr p)))

(define (lower-bound p)
  (if (< (car p) (cdr p))
      (car p)
      (cdr p)))

