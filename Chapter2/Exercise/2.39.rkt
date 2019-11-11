#lang sicp

(define (accumulate op initial sequence)
  (if [null? sequence]
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if [null? rest]
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

;;;;;;;;;;;


(define (reverse-l sequence)
  (fold-left (lambda (x y) (cons y x)) null sequence))

(define (reverse-r sequence)
  (fold-right (lambda (x y)
                (append y
                        (list x)))
              `()
              sequence))
;;;;
(reverse-l (list 1 2 3 4))
(reverse-r (list 1 2 3 4))



