#lang sicp

;;实现带密码的银行账户创建
(define (make-account balance password)
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
  (define (authorize-dispatch word m)
    (if [eq? word password]
        (dispatch m)
        (lambda (x)
          (display "Increct password"))))
  authorize-dispatch)


(define s1 (make-account 100 'password))

((s1 'pasd 'deposit) 10)
