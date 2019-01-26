#lang racket

(require "../Exercise/2.46.rkt")
(require "../Exercise/2.47.rkt")

(define (frame-coord-map frame)
  (lambda (v)
    (sub-vect (origin-frame frame)
              (sub-vect (scale-vect (xcor-vect v)
                                    (edge1-frame frame))
                        (scale-vect (ycor-vect v)
                                    (edge2-frame frame))))))

