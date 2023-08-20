#lang sicp

;;;实现正确版本的count-pairs

;;计算pair数量(不递归版本， 嵌套序列算一个)
(define (no-recur-count-pairs x)
  (define (loop len now rest)
    (begin (if [pair? now] (set! len (+ len 1)))
           (if [null? rest]
               len
               (loop len (car rest) (cdr rest)))))
  (loop 0 '() x))


;;嵌套版本
(define (count-pairs x)
  (define (inner x memo-list)
    (if [and [pair? x]
             [not (memq x memo-list)]]
        (inner (car x)
               (inner (cdr x)
                      (cons x memo-list)))
               memo-list))
  (length (inner x '())))

(define case1 (list 1 2 3)) ;;0
(define case2 (list 1 '(2 3) '(4 5 6))) ;;2
