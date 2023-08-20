#lang sicp


;;实现双端队列
;;要求实现如下方法 make-deque, empty-deque?,front-deque,rear-deque,front-insert-deque!, rear-insert-deque!,front-delete-deque!, rear-delete-deque!

(define (make-deque)
  (cons '() '()))

(define (front-deque deque)
  (car deque))

(define (rear-deque deque)
  (cdr deque))

(define (empty-deque? deque)
  [null? (front-deque deque)])

(define (set-front-ptr! queue item)
  (set-car! queue item))

(define (set-rear-ptr! queue item)
  (set-cdr! queue item))


(define (insert-rear-deque! queue item)
  (let ((new-pair (cons item '())))
    (cond ([empty-deque? queue]
           (set-front-ptr! queue new-pair) (set-rear-ptr! queue new-pair))
          (else
           (set-cdr! (rear-deque queue) new-pair)
           (set-rear-ptr! queue new-pair)))))

(define (delete-front-deque! queue)
  (cond ([empty-deque? queue] (error "ERROR delete a empty queue" queue))
        (else
         (set-front-ptr! queue (cdr (front-deque queue)))
         queue)))

;;;下面是新功能，尾端删除，头部插入

(define (insert-front-deque! queue item)
  (let ((new-pair (cons item '())))
    (cond ([empty-deque? queue]
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair))
          (else
           (set-cdr! new-pair (front-deque queue))
           (set-front-ptr! queue new-pair)))))

;;;尾端删除暂时先只用O(N)的实现
(define (delete-rear-deque! queue)
  (define (iter rest)
    (if [null? (cddr rest)]
        (let ((top-element (car rest)))
          (set-cdr! rest '()))
        (iter (cdr rest))))
  (iter (front-deque queue)))



(define (print-deque queue)
  (define (loop rest)
    (if [null? rest]
        (display "$")
        (begin (display (car rest)) (display "->")
               (loop (cdr rest)))))
  (loop (front-deque queue)))


;;测试代码
(define dq (make-deque))

(insert-rear-deque! dq 0)
(insert-rear-deque! dq 1)
(insert-rear-deque! dq 2)
(insert-rear-deque! dq 3)

(insert-front-deque! dq "a")

(delete-rear-deque! dq)


(print-deque dq)
