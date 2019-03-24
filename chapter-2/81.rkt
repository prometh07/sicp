#lang sicp

; a
; for 2 complex numbers no procedure is found, so we try coercion
; so the result is an infinite recursion
; b
; it depends - sometimes it would be helpful to define a third type of coercion,
; that is to rise both arguments to their 'parent' types
; (* coercions of type A to type A should be forbidden [community.schemewiki.org])
; c
; trivial, just check if type1 is equal to type2, if yes, then rise an error
; immediately
