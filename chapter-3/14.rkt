#lang sicp

(define (mystery x)
  (define (loop x y)
    (if (null? x)
      y
      (let ((temp (cdr x)))
        (set-cdr! x y)
        (loop temp x))))
  (loop x '()))

; mystery just reverses a list in place ;)
(define v (list 'a 'b 'c 'd))
(define w (mystery v))
v
w
; after a call to mystery v still points to a, which is a last element of
; a modified list
