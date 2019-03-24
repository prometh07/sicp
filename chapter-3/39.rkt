#lang sicp

; 101, 121, 100
; and 11 too:
; P1 accesses x [serialized]
; P2 accesses x [serialized]
; P1 sets x to 100 [this is not serialized]
; P2 finishes and sets x to x+1, resulting in 11
