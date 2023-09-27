#lang sicp

(#%require "../Examples/stream.rkt")
(#%require "./3.54.rkt")

(#%provide expand)

(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den) den radix)))



;;解释代码的作用, quotient是取商
;;(expand 1 7 10) 产生元素:
;;(expand 3 8 10)


;记录当前的num*radix和den的商，然后把num*radix mod den 作为新的num
