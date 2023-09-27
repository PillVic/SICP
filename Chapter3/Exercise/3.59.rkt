#lang sicp

(#%require "../Examples/stream2.rkt")
(#%require "../Examples/stream.rkt")
(#%require "./3.50.rkt")
(#%require "./3.54.rkt")

(#%provide integrate-series
           cosine-series sine-series exp-series
           negate print-n
           div-streams)

(define (div-streams s1 s2)
  (mul-streams s1
               (neo-stream-map /
                               ones
                               integers)))

;;此函数返回对级数积分后的新级数系数
(define (integrate-series s)
  (div-streams s
               integers))

(define exp-series
  (cons-stream 1 (integrate-series exp-series)))

;;三角级数定义逻辑：函数导数的不定积分再确定常数就是函数本身
(define (negate x)
  (* -1 x))

(define cosine-series
  (cons-stream 1 (integrate-series (neo-stream-map negate
                                                   sine-series))))

(define sine-series
  (cons-stream 0 (integrate-series cosine-series)))


;;;test
(define (print-n s n)
  (if [= n 0]
      (begin (display n)
             (display ":->")
             (display (stream-ref s n))
             (newline))
      (begin
        (display n)
        (display ":->")
        (display (stream-ref s n))
        (newline)
        (print-n s (- n 1)))))


(print-n cosine-series 9)
