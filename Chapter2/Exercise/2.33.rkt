#lang sicp

;conditon
(define (filter predicate sequence)
  (cond ([null? sequence] nil)
        ([predicate (car sequence)]
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if [null? sequence]
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if [> low high]
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (enumerate-tree tree)
  (cond ([null? tree] nil)
        ((not [pair? tree]) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

;exercise
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x)  y)) nil sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y))
              0
              sequence))
