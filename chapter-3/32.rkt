#lang sicp

; if both inputs are changed in segment 0, then both and-gate-procedures
; are called in the segment and-gate-delay (is it a correct assumption?).
; Therefore, it doesn't really matter which one of these two procedures run
; first as both input wires are already changed and the output value is the same.

; However, there is a difference if we represent the whole agenda
; as a simple LIFO queue.

; --- EDIT
; Actually, there is a difference even if a single time segment becomes a LIFO queue.
; The difference derives from the fact that the new and-gate output value
; is computed right after set-signal! call, when each of action-procedures is
; called. Therefore, if a LIFO queue is used, the and-gate output value
; is incorrect and equal to one, not zero.
