#lang sicp

; a)
; partial-tree elts n - constructs a balanced tree containing the first n elts from the elts list
; if n is 0 - returns a pair (empty set, elts)
; if n > 0, then:
; we divide n into 3 parts:
; - left-size
; - 1 (current node)
; - right-size
; left and right sizes are ~ the halves of n
; then:
; - left-tree becomes the car of result of the application of partial-tree to elts and left-size
; we take omitted elements (remaining-elts) from elts (cdr result) and construct a tree:
;  ((car remaining-elts) left-tree right-tree)
; where the right-tree is a tree made by (partial-tree (cdr remaining-elts) right-size)
; finally, a (tree, remaining elements) pair is returned

; b
; O(n)? 1 fn call for each node of a tree/list
