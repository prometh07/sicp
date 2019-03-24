#lang racket/base

(define (fn a b) ((if (> b 0) + -) a b))

(fn 1 1)
(fn 1 (- 1))
