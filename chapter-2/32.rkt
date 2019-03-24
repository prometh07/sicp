#lang sicp

(define (subsets s)
  (if (null? s)
    (list nil)
    (let ((rest (subsets (cdr s))))
      (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(display (subsets (list 1 2 3)))

; why does it work? there are two cases:
; 1) empty set s - there is only one subset, which is returned as an empty list
; 2) s is not empty - we can divide s into two subsets, the first one x having
; only the first element of s, the second one x' being the rest of s
; if we somehow compute all possible subsets for the rest x', then all subsets of s
; can be obtained by appending x' with x added to x'
