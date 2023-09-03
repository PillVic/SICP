#lang sicp

(#%require "../Examples/stream.rkt")

(#%provide show)

(define (show x)
  (display-line x)
  x)

(define x (stream-enumerate-interval 0 10))

(stream-ref x 5) ;;5
(stream-ref x 7) ;;7
