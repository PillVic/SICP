#lang sicp

(define (reverse l)
  (define (iter l t)
    (if (null? l)
        t
        (iter (cdr l) (cons (car l) t))))
  (iter l nil))

(define deep-reverse
  (lambda (t)
    (if (

;;;;;;test
(define x (list (list 1 2) (list 3 4)))

(display (deep-reverse x))

(newline)

(display (list (list 4 3) (list 2 1)))