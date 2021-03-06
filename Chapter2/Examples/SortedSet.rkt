#lang racket

;implement set by sorted list

(provide element-of-set? intersection-set)

(define (element-of-set? x set)
  (cond ([null? set] false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or [null? set1] [null? set2])
      `()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((< x2 x1)
               (intersection-set set1 (cdr set2)))))))

;test
(define (test)
  (let ([s1 (list 1 2 3 4)]
        [s2 (list 1 3 5 7)])
    (display (element-of-set? 3 s1))
    (display (intersection-set s1 s2))))
