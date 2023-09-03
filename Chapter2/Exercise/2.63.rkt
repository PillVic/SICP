#lang sicp

(#%require "../Examples/TreeSet.rkt")


(define (tree->list-1 tree)
  (if [null? tree]
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if [null? tree]
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

(define tree->list tree->list-2)

(#%provide tree->list)

;;;两个程序在什么时候表现不同
;只要是排序树，两者的执行结果都应当相同

;;分析两者的复杂度

;;第一个方法: append的时间复杂度为o(n)，加上线性复杂度的调用，时间复杂度为平方复杂度
;;第二个复杂度：线性复杂度
