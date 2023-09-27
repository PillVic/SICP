#lang sicp

(#%require "../Examples/stream2.rkt")
(#%require "../Examples/stream.rkt")

(define s (cons-stream 1 (add-streams s s)))

;;s应该是2的幂次序列
