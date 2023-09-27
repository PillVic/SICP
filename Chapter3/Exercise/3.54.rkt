#lang sicp

(#%require "../Examples/stream2.rkt")
(#%require "../Examples/stream.rkt")
(#%require "../Exercise/3.50.rkt")

(#%provide mul-streams factorials)

(define (mul-streams s1 s2)
  (neo-stream-map * s1 s2))


(define factorials (cons-stream 1 (mul-streams factorials integers)))
