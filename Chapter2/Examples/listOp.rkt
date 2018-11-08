#lang sicp

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (_ n 1))))

(define (length-r items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (length-i items)
  (define (length-iter a count)
    (if (null? a)
        count
        (length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))


