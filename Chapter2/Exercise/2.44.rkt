#lang racket

;;; include the paint method
( require ( planet "sicp.ss" ( "soegaard" "sicp.plt" 2 1)))

(paint einstein)


(define einstein2 (beside einstein (flip-vert einstein)))

(define einstein4 (below einstein2 einstein2))

(define (flipped-pairs painter)
  (let ((painter2 (beside painter (flip-vert painter))))
    (below painter2 painter2)))

(define (right-split painter n)
  (if [= n 0]
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (up-split painter n)
  (if [= n 0]
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))
