#lang racket

(define a `(1 3 (5 7) 9))

(display (car (cdr (car (cdr (cdr a))))))

(define b `((7)))

(display (car (car b)))

(define c `(1 (2 (3 (4 (5 (6 7)))))))

(display (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr c)))))))))))))