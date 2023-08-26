#lang sicp

;;; include the paint method
(#%require ( planet "sicp.ss" ( "soegaard" "sicp.plt" 2 1)))

(#%provide split)

(define eins einstein)

(define (split t1 t2)
  (lambda (painter n)
    (define (f n)
      (if [= n 0]
          painter
          (let ((smaller (f (- n 1))))
            (t1 painter (t2 smaller smaller)))))
    (f n)))
