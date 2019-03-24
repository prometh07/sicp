#lang sicp

; a) in terms of mutexes - keep a list of mutexes in make-serializer
; and try to acquire one of them when calling a serialized procedures.

; b) in terms of atomic test-and-set! operations - now the cell variable
; inside a mutex is a list of N true/false values; test-and-set! checks if
; any of them is false and sets it to true

; a much better solution - just use a mutex and a counter
