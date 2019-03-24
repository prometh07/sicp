#lang sicp

(define (p) (p))
; applicative-order evaluation - definition error (racket)
; when using sicp lang - no problem with definition

(define (test x y) (if (= x 0) 0 y))

(test 0 (p))
; AOE - infinite loop? can't evaluate p, because it's a self-referencing symbol
; NOE - doesn't evaluate p, because it's not needed
