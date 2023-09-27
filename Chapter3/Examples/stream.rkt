#lang sicp

(#%require "../../Chapter2/Examples/TreeSet.rkt")
(#%require "../../Chapter1/Examples/CheckPrime.rkt")

(#%provide stream-car stream-cdr cons-stream stream-ref
           stream-map stream-for-each stream-filter
           display-stream stream-enumerate-interval
           display-line)

(define (stream-car stream)
  (car stream))

(define (stream-cdr stream)
  (force (cdr stream)))

(define (stream-ref s n)
  (if [= n 0]
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map proc s)
  (if [stream-null? s]
      the-empty-stream
      (cons-stream (proc (stream-car s))
                   (stream-map proc (stream-cdr s)))))

(define (stream-for-each proc s)
  (if [stream-null? s]
      'done
      (begin (proc (stream-car s))
             (stream-for-each proc (stream-cdr s)))))

(define (stream-filter pred s)
  (cond ([stream-null? s] the-empty-stream)
        ([pred (stream-car s)]
         (cons-stream (stream-car s)
                      (stream-filter pred
                                     (stream-cdr s))))
        (else (stream-filter pred (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line e)
  (newline)
  (display e))

(define (stream-enumerate-interval low high)
  (if [> low high]
      the-empty-stream
      (cons-stream low
                   (stream-enumerate-interval (+ low 1) high))))

;;from lecture

(define (stream-accumulate combiner init-val s)
  (if [stream-null? s]
      init-val
      (combiner (stream-car s)
                (stream-accumulate combiner
                                   init-val
                                   (stream-cdr s)))))

(define (stream-append s1 s2)
  (if [stream-null? s1]
      s2
      (cons-stream
       (stream-car s1)
       (stream-append (stream-cdr s1)
                      s2))))

(define (enumerate-tree tree)
  (if [(not (pair? tree))]
      (cons-stream tree
                   the-empty-stream)
      (stream-append
       (enumerate-tree (left-branch tree))
       (enumerate-tree (right-branch tree)))))

(define (flatten stream-of-stream)
  (stream-accumulate stream-append
                     the-empty-stream
                     stream-of-stream))

(define (flatmap f s)
  (flatten (stream-map f s)))

(define (prime-sum-pairs n)
  (stream-map
   (lambda (p)
     (list (car p)
           (cadr p)
           (+ (car p) (cadr p))))
   (stream-filter
    (lambda (p)
      (prime? (+ (car p) (cadr p))))
    (flatmap
     (lambda (i)
       (stream-map
        (lambda (j) (list i j))
        (stream-enumerate-interval 1 (- i 1))))
     (stream-enumerate-interval 1 n)))))

;;collect
;https://github.com/mattdsteele/sicp/blob/master/library/collect.scm
