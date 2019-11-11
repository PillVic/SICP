#lang racket

;;;;;;fast check prime method

(define square
  (lambda (x)
    (* x x)))

(define (devides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((devides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))


(define (prime? n)
  (= n (smallest-divisor n)))


;;;over is the condition on the text

(define (accumulate op initial sequence)
  (if [null? sequence]
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define enumerate-interval range)


;;;;

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))


;;;;;;;
(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (range 1 i)))
           (range (+ n 1))))


;;;;;;;;;;;
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))

;;;;;;;;;;;test

(unique-pairs 6)

(prime-sum-pairs 6)


