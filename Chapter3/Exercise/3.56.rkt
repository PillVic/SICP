#lang sicp

(#%require "../Examples/stream.rkt")
(#%require "../Examples/stream2.rkt")
(#%require "../Exercise/3.54.rkt")

(#%provide merge)


;合并两个顺序流，并去除重复元素

(define (merge s1 s2)
  (cond ([stream-null? s1] s2)
        ([stream-null? s2] s1)
        (else
         (let ([s1car (stream-car s1)]
               [s2car (stream-car s2)])
           (cond ([< s1car s2car]
                  (cons-stream s1car (merge (stream-cdr s1) s2)))
                 ([> s1car s2car]
                  (cons-stream s2car (merge s1 (stream-cdr s2))))
                 (else
                  (cons-stream s1car (merge (stream-cdr s1)
                                            (stream-cdr s2)))))))))


;;;利用merge函数，构造不含2,3,5以外质因数的数字流

(define S (cons-stream 1
                       (merge (scale-stream S 2)
                              (merge (scale-stream S 3)
                                     (scale-stream S 5)))))

;;;;;
(define (output-test n)
  (if [= n -1]
      '()
      (begin
        (display (stream-ref S n))
        (newline)
        (output-test (- n 1)))))

(output-test 20)

