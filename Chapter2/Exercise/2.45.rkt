#lang racket

;;; include the paint method
( require ( planet "sicp.ss" ( "soegaard" "sicp.plt" 2 1)))

(define eins einstein)


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

(define (corner-split painter n)
  (if [= n 0]
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside (flip-horiz quarter) quarter)))
      (below (flip-vert half) half))))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
      (bottom (beside (bl painter) (br painter))))
    (below bottom top))))

(define (split t1 t2)
  (lambda (painter n)
    (define (f n)
      (if [= n 0]
          painter
          (let ((smaller (f (- n 1))))
            (t1 painter (t2 smaller smaller)))))
    (f n)))

(define rs (split beside below))
(paint (rs eins 4))
(paint (right-split eins 4))