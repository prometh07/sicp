#lang sicp
; original algorithm is theta(log n); here, at each call for an even number we spawn another
; two recursive procedures
; let's say n = 2^k, k some positive integer, let be f a complexity of an algorithm
; f(2^k) = 2*f(2^(k-1)) = 2^2 * f(2^(k-2)) = ... = 2^k * f(2^0) = 2^k * f(1) =
; = 2^k = n
; so the number of elementary steps of this algorithm is linear in terms of input n (alg is theta(n))
