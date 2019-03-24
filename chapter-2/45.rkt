#lang sicp
(#%require sicp-pict)

(define (split outside-op inside-op)
  (define (fn painter n)
    (if (= n 0)
      painter
      (let ((smaller (fn painter (- n 1))))
        (outside-op painter (inside-op smaller smaller)))))
  fn)
(define split-right (split beside below))
(define up-split (split below beside))

(paint (split-right einstein 1))
(paint (up-split einstein 1))