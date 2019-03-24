; (define sum 0)
; 0
; (define seq ...)
; 1
; (define y ...)
; 6
; (define z ...)
; 10 (1 3 and 6 are memoized so we don't compute them again)
; (stream-ref y 7)
; 136 (because streams are 0-indexed too)
; (display-stream z)
; 210 (which is equal to (1..20).sum)

; The outputs would be very different once we decided to remove memoization
; from the delay procedure. Now the sum would be modified on every iteration
; (on every call to stream-cdr):
; (define seq ...) => 1
; (define y ...) => 6
; (define z ...) => 15
