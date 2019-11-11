#lang sicp
;;;;;;;;;;;;;;;
;构造二叉活动体,忽略杆的重量，杆有长度
;每个节点连接两个节点
;每个节点都有length
;叶子节点为一个数字代表重量
;其他节点连接另一个二叉活动体
;;;;;;;;;;;;;;;;;;


;;;;conditon

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;;;;;;;;;;;;;question a

(define left-branch
  (lambda (structure)
    (car structure)))

(define right-branch
  (lambda (structure)
    (cadr structure)))

(define branch-length
  (lambda (branch)
    (car branch)))

(define branch-structure
  (lambda (branch)
    (cadr branch)))


;quesiton b

(define total-weight
  (lambda (root)
    (cond ([pair? root]
           (+ (total-weight (branch-structure (left-branch root)))
              (total-weight (branch-structure (right-branch root)))))
          (else root))))
           
;question c

(define check-balance
  (lambda (struct)
    (let ([lb (left-branch struct)]
          [rb (right-branch struct)])
      (= (* (branch-length lb)
            (total-weight (branch-structure lb)))
         (* (branch-length rb)
            (total-weight (branch-structure rb)))))))

;test

(define b3 (make-branch 2 3))
(define b4 (make-branch 2 4))
(define s (make-mobile b3 b4))
(define b1 (make-branch 1 s))
(define b2 (make-branch 1 2))
(define root (make-mobile b1 b2))

(display (total-weight root))
(display (check-balance root))
