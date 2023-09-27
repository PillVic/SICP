#lang sicp

(#%require "./stream.rkt")
(#%require "../../Chapter1/Examples/example.rkt")
(#%require "../Exercise/3.50.rkt")

(#%provide add-streams integers ones scale-stream)

;无穷流
(define (integers-starting-from n)
  (cons-stream n
               (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 1))

(define (divisible? x y) [= (remainder x y) 0])

(define no-sevens (stream-filter (lambda (x) (not (divisible? x 7)))
                                 integers))

(define (fibgen a b)
  (cons-stream a (fibgen b (+ a b))))

(define fibs (fibgen 0 1))

;;最简单粗暴的解法：与所有的小于它的质数不能整除
(define (sieve stream)
  (cons-stream
   (stream-car stream)
   (sieve (stream-filter
           (lambda (x)
             (not (divisible? x (stream-car stream))))
           (stream-cdr stream)))))

(define primes (sieve (integers-starting-from 2)))


;;递归定义全1序列
(define ones (cons-stream 1 ones))

(define (add-streams s1 s2)
  (neo-stream-map + s1 s2))

(define integers-2 (cons-stream 1 (add-streams ones integers-2)))

(define fibs-2
  (cons-stream 0
               (cons-stream 1
                            (add-streams (stream-cdr fibs-2) fibs-2))))

(define (scale-stream stream factor)
  (neo-stream-map (lambda (x) (* x factor)) stream))

(define double (cons-stream 1 (scale-stream double 2)))

;素数

(define primes-2
  (cons-stream
   2
   (stream-filter prime? (integers-starting-from 3))))

(define (prime? n)
  (define (iter ps)
    (cond ([> (square  (stream-car ps)) n] true)
          ([divisible? n (stream-car ps)] false)
          (else (iter (stream-cdr ps)))))
  (iter primes))
