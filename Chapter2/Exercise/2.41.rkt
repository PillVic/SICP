#lang racket

;;;over is the condition on the text

(define (accumulate op initial sequence)
  (if [null? sequence]
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;;;;

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))


;;;;;;;
(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (range 1 i)))
           (range (+ n 1))))


(define (triple s)
  (filter (lambda (t)
            (and [> (caddr t) 0] [> (car t) (cadr t) (caddr t)]))
          (map (lambda (tuple)
                 (list (car tuple)
                       (cadr tuple)
                       (- s (car tuple)
                            (cadr tuple))))
               (unique-pairs s))))
 
;;;;;;;;;;;test

(triple 15)


