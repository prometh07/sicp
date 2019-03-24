#lang sicp

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch m)
  (car m))

(define (right-branch m)
  (cadr m))

(define (branch-length b)
  (car b))

(define (branch-structure b)
  (cadr b))

(define (total-weight m)
  (cond
    ((null? m) 0)
    ((not (pair? m)) m)
    (else (+
      (total-weight (branch-structure (left-branch m)))
      (total-weight (branch-structure (right-branch m)))))))

(define mobile (make-mobile
  (make-branch 1 1)
  (make-branch 1
    (make-mobile
      (make-branch 1 2)
      (make-branch 1 3)))))

(total-weight mobile)

(define (balanced? m)
  (define (torque b) (* (branch-length b) (total-weight (branch-structure b))))
  (cond
    ((not (pair? m)) true)
    ((not (= (torque (left-branch m)) (torque (right-branch m)))) false)
    (else (and
      (balanced? (branch-structure (left-branch m)))
      (balanced? (branch-structure (right-branch m)))))))

(balanced? mobile)

(define balanced-mobile (make-mobile
  (make-branch 1 10)
  (make-branch 10 1)))
(balanced? balanced-mobile)

; d - just change cadr into cdr
