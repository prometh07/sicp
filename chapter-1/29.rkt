#lang sicp

(define (cube x) (* x x x))

(define (sum f a b step)
  (define (iter result index)
    (cond
      ((> index b) result)
      (else (iter (+ result (f index)) (step index)))))
  (iter 0 a))

(define (simpson-rule f a b n)
  (define h (/ (- b a) n))
  (define (step c) (+ c h h))
  (* (/ h 3.0)
    (+ a b
      (* 4 (sum f (+ a h) (- b h) step))
      (* 2 (sum f (+ a h h) (- b h) step))))) ; (- b h) to avoid adding last element twice
                                              ; (see formula and take a look at a and b added explicitly without 2/4 factor)
(simpson-rule cube 0 1 100)
(simpson-rule cube 0 1 1000)
(simpson-rule cube 0 1 10)

; 0.25 exactly
