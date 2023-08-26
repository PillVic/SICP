#lang sicp


(#%provide assoc lookup insert! make-table)

(define (lookup key table)
  (let ((record (assoc key (cdr table))))
    (if record
        (cdr record)
        false)))

;;找不到返回false,找到就返回其所在的位置
(define (assoc key records)
  (cond ([null? records] false)
        ([equal? key (caar records)] (car records))
        (else
         (assoc key (cdr records)))))

(define (insert! key value table)
  (let ((record (assoc key (cdr table))))
    (if record
        (set-cdr! record value)
        (set-cdr! table
                  (cons (cons key value) (cdr table)))))
  'ok)

(define (make-table)
  (list '*table*))
