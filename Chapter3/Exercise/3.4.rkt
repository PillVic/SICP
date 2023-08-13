#lang sicp

;;在密码的基础上， 增加犯错次数限制， 7次直接报警
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
  (define error-count 0)
  (define (authorize-dispatch word m)
    (if [eq? password word]
        (dispatch m)
        (lambda (x)
          (if [> error-count 6]
              (display "FBI open the door\n")
              (begin (set! error-count (+ error-count 1))
                     (display "Increct password\n"))))))
  authorize-dispatch)

(define s (make-account 100 'password))

((s 'password 'withdraw) 10)

((s 'pssword 'withdraw) 10)
((s 'pssword 'withdraw) 10)
((s 'pssword 'withdraw) 10)
((s 'pssword 'withdraw) 10)
((s 'pssword 'withdraw) 10)
((s 'pssword 'withdraw) 10)
((s 'pssword 'withdraw) 10)
((s 'pssword 'withdraw) 10)
((s 'pssword 'withdraw) 10)
((s 'pssword 'withdraw) 10)
((s 'pssword 'withdraw) 10)
((s 'pssword 'withdraw) 10)
((s 'pssword 'withdraw) 10)
((s 'pssword 'withdraw) 10)
((s 'pssword 'withdraw) 10)
((s 'pssword 'withdraw) 10)
((s 'pssword 'withdraw) 10)
