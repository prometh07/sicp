#lang sicp

10 ; 10
(+ 5 3 4) ; 12
(- 9 1) ; 8
(/ 6 2) ; 3
(+ (* 2 4) (- 4 6)) ; 6
(define a 3) ; implementation-dependent, dr racket - nothing
(define b (+ a 1)) ; 4
(+ a b (* a b)) ; 19
(= a b) ; false
(if  (and (> b a) (< b (* a b))) b a) ; 4
; cond ...
; 16
; ...
; 6
; ...
; 16
