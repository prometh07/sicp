#lang sicp

; a1, a2, a3 = 10, 20, 30
; swaps: a1-a2, a1-a3
; If the processes are run sequentially, then at any given time the accounts'
; balances are still 10, 20, 30 in some order. No other result is possible
; as every swap operation is uninterruptible.

; What might go wrong if we run swaps concurrently?
; for example, in the middle of the a1-a2, right after a withdrawal from a1,
; we might switch to another swap, a1-a3:
; a1 withdrawal => a1 = 20, a2 = 20, a3 = 30
; a1-a3 => 30, 20, 20
; a2 deposit => 30, 10, 30

; The total sum of balances is going to be equal thanks to the individual
; account serializers. 
