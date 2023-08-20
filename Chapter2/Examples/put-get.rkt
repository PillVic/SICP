#lang racket

(define *op-table* (make-hash))

(define (put op type proc)
  (hash-table/put *op-table* (list op type) proc))

(define (get op type proc)
  (hash-table/get *op-table* (list op type) #f))
