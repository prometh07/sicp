#lang sicp

; (list 'a 'b 'c) - a->b->c->nil
; (make-cycle (list 'a 'b 'c)) - returns a list
; z variable: a -> b -> c
;             ^---------|
; calling (last-pair z) causes an infinite loop
