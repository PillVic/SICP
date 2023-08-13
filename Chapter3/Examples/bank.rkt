#lang racket

(define balance 100)

(define (withdraw amount)
  (if [>= balance amount]
      (begin (set! balance (- balance amount))
             balance)
      ("Insufficient funds")))

;;将balance约束到方法内，得到如下的新方法
(define (new-withdraw amount)
  (let ((balance 100))
    (lambda (amount)
      (if [>= balance amount]
          (begin (set! balance (- balance amount))
                 balance)
          ("Insufficient funds")))))

(define (make-withdraw balance)
  (lambda (amount)
    (if [>= balance]
        (begin (set! balance (- balance amount))
               balance)
        ("Insufficient funds"))))

;;构建银行账户

(define (make-account balance)
  (define (withdraw amount)
    (if [>= balance amount]
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ([eq? m 'withdraw] withdraw)
          ([eq? m 'deposit] deposit)
          (else (error "Unknown requrest --MAKE-ACCOUNT" m))))
  dispatch)

(define acc (make-account 100))

((acc 'withdraw) 30)
((acc 'deposit) 30)
