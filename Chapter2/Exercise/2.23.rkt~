#lang sicp

(define square
  (lambda (x)
    (* x x)))

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)))))

(square-list `(1 2 3 4))

(define (square-list-m items)
  (map square items))