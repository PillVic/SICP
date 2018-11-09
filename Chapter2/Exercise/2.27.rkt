#lang sicp

(define (reverse l)
  (define (iter l t)
    (if (null? l)
        t
        (iter (cdr l) (cons (car l) t))))
  (iter l nil))

(define (deep-reverse t)
  (define (iter sub r)
    (if [null? sub]
        r
        (iter (cdr sub)
              (cons (if [pair? (car sub)]
                        (deep-reverse (car sub))
                        (car sub))
                    r))))
  (iter t nil))

;;;;;;test
(define x (list (list 1 2) (list 3 4)))

(display x)

(newline)

(display (reverse x))

(newline)

(display (deep-reverse x))
