#lang racket

(define (accumulate op initial sequence)
  (if [null? sequence]
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if [null? (car seqs)]
      null
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))
;;;;;

(define (matrix-*-vector m v)
  (map (lambda (column) (dot-product v column)) m))

(define (transpose mat)
  (accumulate-n cons null mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (line)
           (map (lambda (col)
                  (dot-product line col))
                cols))
         m)))
  
                  
   
;;;;;;;;;;test

(define matrix `((1 2 3 4) (5 6 7 8) (9 10 11 12) (13 14 15 16)))
(define identity `((2 0 0 0) (0 2 0 0) (0 0 2 0) (0 0 0 2)))
(define v `(0 0 0 0))
(matrix-*-vector matrix v)
(transpose matrix)
(matrix-*-matrix identity matrix )

(define m (list (list 1 2 3 4)
                      (list 4 5 6 6)
                      (list 6 7 8 9)))

(matrix-*-matrix m (transpose m))
