#lang sicp

; given solution creates a new averaged stream X incorrectly - value X_n
; isn't an average of the original S_n and S_(n-1), but a weighted average of S_n and
; all the previous elements. To create a correct stream one has to pass another
; argument, the previous value from the original stream, S_(n-1), and use it
; to compute an averaged point
