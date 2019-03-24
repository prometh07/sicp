#lang sicp

; n symbols with frequencies 2^0, 2^1, ... 2^(n-1)
; In this case the most frequent symbol consumes just a one bit. A general
; formula describing a number of bits used for the n-th most frequent symbol is:
; bits(n) = n-1
