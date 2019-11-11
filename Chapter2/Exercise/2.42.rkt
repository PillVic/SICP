#lang racket

(define (queens board-size)
  (define (queen-cols k)
    (if [= k 0]
        (list empty-board)
        (filter (lambda (positions)
                  [safe? k opsitions])
                (flatmap (lambda (rest-of-queens)
                           (map (lambda (new-row)
                                  (adjoin-position new-row
                                                   k
                                                   rest-of-queens))
                                (range 1 board-size)))
                         (queen-cols (- k 1))))))
  (queen-cols board-size))

;using recursive method,from k-1 base case to k size to board size

;safe?

;adjoin-position

;empty-board

        