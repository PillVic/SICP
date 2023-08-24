#lang sicp

(#%require "../Examples/TreeSet.rkt")

(#%provide list->tree)

;;;将排序表构建成一个二叉树
(define (partial-tree elets n)
  (if [= n 0]
      (cons '() elets)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elets left-size)))
          (let ((left-tree (car left-result))
                (non-left-elets (cdr left-result))
                (right-size (- n (+ left-size 1))))
               (let ((this-entry (car non-left-elets))
                     (right-result (partial-tree (cdr non-left-elets)
                                                 right-size)))
                 (let ((right-tree (car right-result))
                       (remaining-elements (cdr right-result)))
                   (cons (make-tree this-entry left-tree right-tree)
                         remaining-elements))))))))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

;;test
(define sample-list (list 1 3 5 7 9 11))

(define tree (list->tree sample-list))



;;解释程序的运行原理
;;构建子程序， 返回由：树 剩余元素构成的列表,
;;取前半元素构建左子树，后半元素构建右子树, 递归调用自身，基准case为元素个数为0,返回空列表



;;分析程序的运行复杂度
;;整个程序最后可以看作节点自底向上构建二叉树，每个节点调用一次，最大开销的操作是cons, 故复杂度为O(n)
