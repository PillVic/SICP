#lang sicp


;;

(#%provide make-table)

(define (make-table same-key?)
 (let ((local-table (list '*table*)))
   (define (assoc key table)
     (cond ([null? table] false)
           ([same-key? key (caar table)] (car table))
           (else
            (assoc key (cdr table)))))

   (define (lookup key)
     (let ((record (assoc key (cdr local-table))))
       (if record
           (cdr record)
           false)))

   (define (insert! key value)
     (let ((record (assoc key (cdr local-table))))
       (if record
           (set-cdr! record value)
           (set-cdr! local-table
                     (cons (cons key value)
                           (cdr local-table)))))
     'ok)

   (define (dispatch op)
     (cond ([eq? op 'lookup] lookup)
           ([eq? op 'insert!] insert!)
           (else (error op))))

   dispatch))


;;test

(define table (make-table eq?))
((table 'insert!) 1 'a)
((table 'insert!) 2 'b)
((table 'lookup) 2)
