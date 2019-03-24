#lang sicp

(define (count-pairs x)
  (if (not (pair? x))
    0
    (+
      (count-pairs (car x))
      (count-pairs (cdr x))
      1)))

(define x (list (list 1) 2))
(count-pairs x)

(define p (list 1 2))
(define y (cons p (cdr p)))
(count-pairs y)

(define q (cons 1 2))
(define r (cons q q))
(define z (cons r r))
(count-pairs z)


; (define t (list 1 1))
; (set-car! (cdr t) t)
; to run forver, it's enough to create any cycle in the given structure. For
; instance, we might redirect (cdr x) to point again to the x pair
