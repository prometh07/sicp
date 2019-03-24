#lang sicp

; [a,b] + [c,d] = [a+c,b+d]
; width of an interval = (upper_bound - lower_bound) / 2
; (b-a)/2 + (d-c)/2 = ((b+d) - (a+c))/2  (obvious)

; multiplication - quite obvious when one takes a look at the multiplication definition
; resulting interval has a form of [x*y, x'*y'], where x/x' and the corresponding
; y values are either lower or upper bounds of input intervals
; (x'y' - xy)/2 cannot be written as a simple function of input intervals' midpoints
