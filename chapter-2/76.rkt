#lang sicp

; op = |operations|
; tp = |types|

; generic operations with explicit dispatch
; - new type - op changes (add a new if condition to existing procedures)
; - new operation - tp changes (add a new procedure with specific implementations
; for different types)

; data-directed style
; - new type - add a specific implementation for each generic method used
; by the type
; - new operation - add specific implementations for each supported type

; message-passing style
; - new type - create a new constructor procedure returning another procedure
; responsible for dispatching on method name
; - new operation - implement a new operation inside a constructor function

; which organization would be most appropriate for a system in which new types must often be added?
;   probably not 1) because of multiple distributed changes needed
;   2) - depends on the operation/type table implementation
;   3) - sounds good, but how to avoid code duplication when multiple types
;     are similar?

; ... in which new operations must be often added?
; 1) - one place in code to change
; 2) - add specific implementations to a generic table
; 3) - modify all supported types

; types often added - 3rd way preferred (message passing)
; new operations often added - data-driven way (2nd)
