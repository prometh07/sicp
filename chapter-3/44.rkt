#lang sicp

; Transfer procedure consists of 2 atomic operations, each modifying a different
; variable. Exchange operation, on the other hand, computes a temporary
; variable 'difference' using both account balances. That's the step where we
; need to ensure no other procedure touches balances - hence the double serialization.
