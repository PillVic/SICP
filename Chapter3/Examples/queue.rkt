#lang sicp

;;实现队列， 涉及如下接口
;;make-queue, empty-queue?, insert-queue, delete-queue
;;基础方法
(define (front-ptr queue)
  (car queue))

(define (rear-ptr queue)
  (cdr queue))

(define (set-front-ptr! queue item)
  (set-car! queue item))

(define (set-rear-ptr! queue item)
  (set-cdr! queue item))

;;
(define (empty-queue? queue)
  [null? (front-ptr queue)])

(define (make-queue)
  (cons '() '()))

(define (front-queue queue)
  (if [empty-queue? queue]
      (error "empty list")
      (car (front-ptr queue))))

(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ([empty-queue? queue]
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
          (else
           (set-cdr! (rear-ptr queue) new-pair)
           (set-rear-ptr! queue new-pair)
           queue))))

(define (delete-queue! queue)
  (cond ([empty-queue? queue] (error "ERROR delete a empty queue" queue))
        (else
         (set-front-ptr! queue (cdr (front-ptr queue)))
         queue)))


;;3.21
(define (print-queue queue)
  (define (print x)
    (if [null? x]
        (newline)
        (begin (display (car x)) (display "->")
               (print (cdr x)))))
  (print (car queue)))
