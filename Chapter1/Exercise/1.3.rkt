(define (max-sum a b c)
  (cond ((and (< a b) (< a c)) (/ (+ c b) 2))
	((and (< b a) (< b c)) (/ (+ a c) 2))
	(else (/ (+ a b) 2))))
