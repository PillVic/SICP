#lang sicp


(define (fringe t)
  (define (iter sub r)
    (cond ([null? sub] r)
          ((not [pair? sub])
           (append r (list sub)))
          (else
           (append (fringe (car sub))
                   (fringe (cdr sub))))))
  (iter t nil))



;;;;;;test

(define x (list (list 1 2) (list 3 4)))

(display (fringe x))

(newline)

(display (fringe (list x x)))