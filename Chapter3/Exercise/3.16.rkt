#lang sicp

(define (count-pairs x)
  (if (not [pair? x])
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))


;;;这个函数只考虑了最简单的情况：列表的所有元素都是原子类型
;;构建 3,4,7, 不返回的范例
(define case1 (list 1 2 3)) ;;3
(define case2 (list '(1) 2 3)) ;;4
(define case3 (list '(1) '(2) '(list '(3)))) ;;7

;;不返回的就用make-cycle做
