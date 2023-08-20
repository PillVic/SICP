#lang sicp


(define global-memo (list'()))

;;不应当使用队列来判断是否有环，因为环不一定在开头，也可能在中间
(define (cycle? x)
  (define visited 'visted)
  (define (loop rest)
    (cond ([null? rest] false)
          ([eq? (car rest) visited] true)
          (else (begin (set-car! rest visited)
                       (loop (cdr rest))))))
  (loop x))


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




