#lang sicp

(#%require "../Examples/stream2.rkt")
(#%require "../Examples/stream.rkt")

(define (partial-sums s)
  (define (sub-partial-sum stream current)
    (let ([result (+ current (stream-car stream))])
      (cons-stream result
                   (sub-partial-sum (stream-cdr stream) result))))
  (sub-partial-sum s 0))


;;;test
(define q (partial-sums integers))
(stream-ref q 99)
