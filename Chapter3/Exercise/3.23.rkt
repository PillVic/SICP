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


(define (insert-front-deque! queue item)
  (let ((new-pair (cons item '())))
    (cond ([empty-deque? queue]
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
          (else
           (set-cdr! (rear-deque queue) new-pair)
           (set-rear-ptr! queue new-pair)
           queue))))

(define (delete-rear-deque! queue)
  (cond ([empty-deque? queue] (error "ERROR delete a empty queue" queue))
        (else
         (set-front-ptr! queue (cdr (front-deque queue)))
         queue)))

;;;下面是新功能，尾端插入， 头部删除
