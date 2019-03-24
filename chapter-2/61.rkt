#lang sicp
(#%require "helpers.rkt")

(define (adjoin-set x set)
  (cond
    ((null? set) (list x))
    ((= (car set) x) set)
    ((< (car set) x) (cons (car set) (adjoin-set x (cdr set))))
    ((> (car set) x) (cons x set))))

(log (adjoin-set 1 '()))
(log (adjoin-set 1 (list 1)))
(log (adjoin-set 1 (list 2)))
(log (adjoin-set 1 (list 0)))
(log (adjoin-set 2 (list 1 3)))
(log (adjoin-set 2 (list 1 2 3)))
