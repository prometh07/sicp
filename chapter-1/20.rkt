#lang sicp

(define (gcd a b) (if (= b 0) a (gcd b (remainder a b)))) ; this one cannot be used for example in 2.1 exercise
                                                          ; (gcd -2 4) should be 2, not -2 e.g.

(gcd 206 40)

; normal order evaluation
; (gcd 206 40)
; (if (= 40 0) 206 (gcd 40 (remainder 206 40)))
; (gcd 40 (remainder 206 40))
; (if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))  |+1
; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
; if ... |+2
; (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
; if ... |+4
; ...
; (gcd 206 40) - 0
; (gcd 40 6) - 1
; (gcd 6 4) - 2
; (gcd 4 2) - 4
; (gcd 2 0) - 7 to compute b, 4 to compute final result a
; remainder is calculated 18 times

; applicative order evaluation
; (gcd 206 40)
; (gcd 40 6) +1
; (gcd 6 4) +1
; (gcd 4 2) +1
; (gcd 2 0) +1
; remainder is calculated 4 times
