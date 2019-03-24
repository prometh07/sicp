#lang sicp

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame f) (car f))
(define (edge1-frame f) (cadr f))
(define (edge2-frame f) (caddr f))

(display (origin-frame (make-frame 1 2 3)))
(newline)
(display (edge1-frame (make-frame 1 2 3)))
(newline)
(display (edge2-frame (make-frame 1 2 3)))
(newline)

(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame2 f) (car f))
(define (edge1-frame2 f) (cadr f))
(define (edge2-frame2 f) (cddr f))

(display (origin-frame2 (make-frame2 1 2 3)))
(newline)
(display (edge1-frame2 (make-frame2 1 2 3)))
(newline)
(display (edge2-frame2 (make-frame2 1 2 3)))
(newline)
