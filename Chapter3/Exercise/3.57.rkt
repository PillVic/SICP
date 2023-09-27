#lang sicp

(#%require "../Examples/stream.rkt")
(#%require "../Exercise/3.50.rkt")

;;;利用add-streams 构建计算斐波那契序列需要的计算是n次

(define (add-streams s1 s2)
  (let ([count 0])
    (neo-stream-map (lambda (a b)
                      (begin (set! count (+ count 1))
                             (display "count:") (display count)
                             (newline)
                             (+ a b)))
                    s1
                    s2)))

(define fibs
  (cons-stream 0
               (cons-stream 1
                            (add-streams (stream-cdr fibs) fibs))))


(stream-ref fibs 10)
