#lang sicp

; It doesn't work because you have to implement those specific methods
; in the complex package first (for polar or rectangular forms)

; (magnitude z)
; apply-generic for '(complex) type returns a package-internal magnitude procedure
; which should call apply-generic again, now resulting in a specific implementation,
; either from polar or rectangular package.

; (magnitude z) -> (apply-generic 'magnitude z) ->
; (magnitude (contents z)) -> (apply-generic 'magnitude (contents z)) ->
; (specific implementation for magnitude called for (contents (contents z)))
