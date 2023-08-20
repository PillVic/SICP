#lang sicp

;;定义如下方法
;;make-queue insert-queue!, delte-queue!

;;通过构建局部状态过程实现

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))

    (define (empty-queue?)
      [null? front-ptr])

    (define (print-queue)
      (define (loop rest)
        (if [null? rest]
            (begin (display ".") (newline))
            (begin
              (display (car rest)) (display "->")
              (loop (cdr rest)))))
      (loop front-ptr))

    (define (insert-queue! x)
      (let ((new-pair (cons x '())))
        (if (empty-queue?)
            (begin
              (set! front-ptr new-pair)
              (set! rear-ptr new-pair))
            (begin
              (set-cdr! rear-ptr new-pair)
              (set! rear-ptr new-pair)))))

    (define (delete-queue!)
      (set! front-ptr (cdr front-ptr)))

    (lambda (op)
      (cond ([eq? op 'insert] insert-queue!)
            ([eq? op 'print] print-queue)
            ([eq? op 'delete] delete-queue!)))))


;;测试

(define queue (make-queue))
((queue 'insert) 1)
((queue 'insert) 2)
((queue 'insert) 3)
((queue 'insert) 4)
((queue 'delete))

((queue 'print))

