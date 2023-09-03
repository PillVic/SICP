#lang sicp

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

(define (memo-proc proc)
  (let ([already-run? false]
        [result false])
    (lambda ()
      (if [not already-run?]
          (begin (set! already-run? true)
                 (set! result (proc))
                 result)
          result))))



(define (stream-enumerate-interval low high)
  (if [> low high]
      the-empty-stream
      (cons-stream low
                   (stream-enumerate-interval (+ low 1) high))))
