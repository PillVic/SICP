#lang sicp

(#%require "../Examples/stream.rkt")

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq (stream-map accum (stream-enumerate-interval 1 20)))

(define s1 sum)

(define y (stream-filter even? seq))

(define s2 sum)

(define z (stream-filter (lambda (t) [= (remainder t 5) 0])
                         seq))

(define s3 sum)

(stream-ref y 7)

(define s4 sum)

(display-stream z)

(define s5 sum)
