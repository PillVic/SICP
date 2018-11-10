#lang sicp

;condition

(define square
  (lambda (x)
    (* x x)))

(define tree-map
  (lambda (f tree)
    (cond ([null? tree]
           nil)
            ((not [pair? tree])
             (f tree))
            (else
             (cons (tree-map f (car tree))
                   (tree-map f (cdr tree)))))))


;test

(define (square-tree tree)
  (tree-map square tree))

(define tree (list 1 (list 2 (list 3 4) 5)))

(display (square-tree tree))