#lang racket

(require "../Examples/SortedSet.rkt")

(provide adjoin-set)

(define (adjoin-set x set1)
  (if [null? set1]
      (list x)
      (let ([current-element (car set1)]
            [remain-element (cdr set1)])
        (cond ([= x current-element] ;;element already exist
               set1)
              ([> x current-element] ;;element do not exist in this set
               (cons current-element
                     (adjoin-set x remain-element)))
              ([< x current-element]
               (cons x set1))))))
;test
(define (test)
  (let ([x 1]
        [y 3]
        [set1 (list 2 4 5 6)])
    (display (adjoin-set x set1))
    (newline)
    (display (adjoin-set y set1))))


