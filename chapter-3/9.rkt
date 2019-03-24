#lang sicp

; (factorial 6) - recursive version
; a new frame
; [n = 6] -> global
; (if (= n 1) 1 (* n (factorial (- n 1))))
; evaluation
; question - what is the order of evaluation inside the if expression?
; if the condition is false, is `1` evaluated at all?
; (if (= 6 1) true-cond false-cond)
; ...
; (* 6 (factorial (- n 1)))

; (factorial (- n 1))
; new frame
; [n = 5] -> [n = 6] -> global
; etc.
; finally we have 6 factorial frames and a 1 global

; (factorial 6) - iterative version
; the global environment contains two bindings - one for the factorial
; function and another one for a fact-iter function.
;
; overall, there are 8 different frames - 1 global, 1 for factorial,
; 6 for fact-iter calls (or just a one, if we consider tail-call optimization).
