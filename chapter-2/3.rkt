#lang sicp

; primitive one, lacking an anchor point in 2d space
; a more refined minimal solution might use this additional argument
; points can be implemented the same way as in the previouse exercise
(define (rectangle a b) (cons a b))
(define (perimeter x) (* 2 (+ (car x) (cdr x))))
(define (area x) (* (car x) (cdr x)))

(perimeter (rectangle 1 1))
(area (rectangle 1 2))
(perimeter (rectangle 1 2))
