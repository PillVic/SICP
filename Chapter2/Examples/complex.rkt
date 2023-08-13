#lang racket

(define (square x) (* x x))

;;以下为附带类型
(define (attach-tag tag contens)
  (cons tag contents))
(define (type-tag datum)
  (if [pair? datum]
      (car datum)
      (error "Bad tagged datum --TAGED" datum)))
(define (contents datum)
  (if [pair? datum]
      (cdr datum)
      (error "BAD tagged datum --CONTENTS" datum)))

(define (rectangular? z)
  (eq? (type-tag z) 'rectangular))

(define (polar? z)
  (eq? (type-tag z) 'polar))

;坐标表示
(define (make-from-real-image-rectangular x y)
  (attach-tag 'rectangular
              (cons x y)))
(define (make-from-mag-ang-rectangular r a)
  (attach-tag 'rectangular
              (cons (* r (cos a))
                    (* r (sin a)))))

(define (real-part-rectangular z)
  (car z))

(define (image-part-rectangular z)
  (cdr z))

(define (magnitude-rectangular z)
  (sqrt (+ (square (real-part-rectangular))
           (square (image-part-rectangular)))))

(define (angle-rectangular z)
  (atan (image-part-rectangular z)
        (real-part-rectangular z)))


;;极坐标表示
(define (make-from-real-image-polar x y)
  (attach-tag 'polar
              (cons (sqrt (+ (square x) (square y)))
                    (atan y x))))
(define (make-from-mag-ang-polar r a)
  (attach-tag 'polar
              (cons r a)))

(define (magnitude-polar z)
  (car z))
(define (angle-polar z)
  (cdr z))

(define (real-part-polar z)
  (* (magnitude-polar z) (cos (angle-polar z))))

(define (image-part-polar z)
  (* (magnitude-polar z) (sin (angle-polar z))))


;利用标识， 统一获取
(define (image-part z)
  (cond ([polar? z] (image-part-polar (contents z)))
        ([rectangular? z] (image-part-rectangular z))
        (else (error "Unknown Type" (type-tag z)))))
(define (real-part z)
  (cond ([polar? z] (real-part-polar (contents z)))
        ([rectangular? z] (real-part-rectangular z))
        (else (error "Unknown Type" (type-tag z)))))

(define (angle z)
  (cond ([polar? z] (angle-polar (contents z)))
        ([rectangular? z] (angle-rectangular z))
        (else (error "Unknown Type" (type-tag z)))))
(define (magnitude z)
  (cond ([polar? z] (magnitude-polar (contents z)))
        ([rectangular? z] (magnitude-rectangular z))
        (else (error "Unknown Type" (type-tag z)))))

;脱离实现的复数运算
(define (make-from-real-image x y)
  (make-from-real-image-rectangular x y))
(define (make-from-mag-ang r a)
  (make-from-mag-ang-polar r a))


(define (add-complex z1 z2)
  (make-from-real-image (+ (real-part z1) (real-part z2))
                        (+ (image-part z1) (image-part z2))))

(define (sub-complex z1 z2)
  (make-from-real-image (- (real-part z1) (real-part z2))
                        (- (image-part z1) (image-part z2))))

(define (mul-complex z1 z2)
  (make-from-mag-ang (* (magnitude z1) (magnitude z2))
                     (+ (angle z1) (angle z2))))
(define (div-complex z1 z2)
  (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
                        (- (angle z1) (angle z2))))
