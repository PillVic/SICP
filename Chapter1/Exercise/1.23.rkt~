#lang sicp

(define square (lambda (x)
                 (* x x)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;;;;over is given in the previous text
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime start-time)))))

(define (report-prime elapsed-time)
  (display "***")
  (display elapsed-time))
;;over is the condition on the problem

(define (next-odd n)
  (if (= (remainder n 2) 1)
      (+ n 2)
      (+ n 1)))

(define (continue-primes n count)
  (cond ((= count 0)
          (display "are primes."))
         ((prime? n)
          (display n)
          (newline)
          (continue-primes (next-odd n) (- count 1)))
         (else
          (continue-primes (next-odd n) count))))

(define (search-for-primes start count)
  (let ((start-time (runtime)))
    (continue-primes start 3)
    (- (runtime) start-time)))
;;;;;;over is the given answer

(define (sfp start count)
  (define (fix a)
    (if (= (remainder a 2) 0)
        (+ a 1)))
  (define (sfp-iter a count)
    (cond ((> count 0)
           (let ((t (runtime)))
           (cond ((prime? a)
                  (display a) (display ":") (display (- (runtime) t))
                  (newline)
                  (sfp-iter (+ a 2) (- count 1)))
                 (else (sfp-iter (+ a 2) count)))))))
               
  (sfp-iter (fix start) count))
            