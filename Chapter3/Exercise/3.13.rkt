#lang sicp


(define (last-pair x)
  (if [null? (cdr x)]
      x
      (last-pair (cdr x))))
;;;;;;;;;;;;;;;;;;;

(define (make-cycle x)
  (set-cdr! (last-pair x) x))

;;test

(define a '(1 2 3))

(define cycle (make-cycle a))

a
;;如果调用last-pair, 则会立刻陷入死循环
