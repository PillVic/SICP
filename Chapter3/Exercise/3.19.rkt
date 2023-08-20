#lang sicp

;;经典快慢指针法
(define (cycle? x)
  (define (loop p1 p2)
    (cond ([null? p2] false)
          ([eq? p1 p2] true)
          ([and (not(null? [cdr p1]))
                (not (null? (cdr p2))) (not(null? (cddr p2)))]
           (loop (cdr p1) (cddr p2)))
          (else false)))
  (if [or (null? (cdr x))
          (null? (cddr x))]
      false
      (loop (cdr x) (cddr x))))

;;测试
(define (last-pair x)
  (if [null? (cdr x)]
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x))

(define normal-list (list 1 2 3))


(define cycle-list (list 7 8 9))
(make-cycle cycle-list)
