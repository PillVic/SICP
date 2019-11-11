#lang sicp

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ([rest (subsets (cdr s))])
        (append rest (map (lambda (x)
                            (cons (car s) x))
                          rest)))))
                                  


;test

(define set (list 1 2 3))

(display (subsets set))