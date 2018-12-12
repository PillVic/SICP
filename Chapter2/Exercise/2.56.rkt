#lang racket

;main method
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (deriv exp var)
  (cond ([number? exp] 0)
        ([variable? exp]
         (if [same-variable? exp var]
             1
             0
             ))
         ([sum? exp]
          (make-sum (deriv (addend exp) var)
                    (deriv (augend exp) var)))
         ([product? exp]
          (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
         ([exponentiation? exp var]
          (cond ([= (exponent exp) 0]
                 1)
                ([= (exponent exp) 1]
                 exp)
                (else
                 (list `* (exponent exp)
                       (list `** (base exp) (- (exponent exp) 1))
                       (deriv (base exp) var)))))
         (else
          (error "unknown expression type --DERIV" exp))))


;sub method
(define (variable? x)
  (symbol? x))

(define (same-variable? v1 v2)
  (and [variable? v1]
       [variable? v2]
       [eq? v1 v2]))

(define =number?
  (lambda (exp num)
    (and [number? exp]
         [= exp num])))

(define (make-sum a1 a2)
  (cond ([=number? a1 0] a2)
        ([=number? a2 0] a1)
        ((and [number? a1] [number? a2])
         (+ a1 a2))
        (else (list `+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or [=number? m1 0]
             [=number? m2 0])
         0)
        ([=number? m1 1] m2)
        ([=number? m2 1] m1)
        ((and [number? m1]
              [number? m2])
         (* m1 m2))
        (else
         (list `* m1 m2))))


(define (sum? x)
  (and [pair? x]
       [eq? (car x) `+]))

(define (addend s)
  (cadr s))

(define (augend s)
  (caddr s))

(define (product? x)
  (and [pair? x]
       [eq? (car x) `*]))

(define (multiplier p)
  (cadr p))

(define (multiplicand p)
  (caddr p))

;;;;;;;;;;;;


(define exponentiation?
  (lambda (expr var)
    (and [eq? (car expr) `**]
         [same-variable? (base expr) var])))

(define (base expr) (cadr expr))

(define (exponent expr) (caddr expr))

(define (make-exponentiation base exponent)
  `(** base exponent))
  


(deriv `(** x 3) `x)

