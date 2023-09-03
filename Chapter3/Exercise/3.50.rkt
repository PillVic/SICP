#lang sicp

(#%require "../Examples/stream.rkt")

(#%provide neo-stream-map)

;定义stream-map的推广

(define (neo-stream-map proc . arguments)
  (if [null? (car arguments)]
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car arguments))
       (apply neo-stream-map
              (cons proc (map stream-cdr arguments))))))
