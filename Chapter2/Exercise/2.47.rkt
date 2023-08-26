#lang sicp

;include the necessary file

(#%provide  origin-frame edge1-frame edge2-frame)

(define (make-fr origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (make-fr2 origin edge1 edge2)
  (list origin edge1 edge2))

;;;;below two functions has the same implementation on either frame structure
(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

;cons pair implementation
(define (edge2-frame frame)
  (cddr frame))

;list implementation?

(define (edge2-frame-list frame)
  (caddr frame))

;decide cons pairs as the implementation?

(define make-frame make-fr)
