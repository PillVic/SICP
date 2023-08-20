#lang sicp

(define (mystery lst)
  (define (loop x y)
    (if [null? x]
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop lst '()))

;;;;;
;;此函数的功能是得到反转列表，并把原列表删除到只剩一个元素, 头部元素被去除增加到新变量尾部, 构成反转的效果

(define lst '(1 2 3 4 5))
(define neo-lst (mystery lst))
