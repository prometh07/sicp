; If we don't keep stream's state in some local variable,
; then to access n-th element of the stream we have to compute
; all the previous ones ( exponential number of calls to improve-guess for n-th element of the stream? )
;
; If the implementation of delay didn't use memo-proc, then both versions
; would have the same (bad) complexity.
