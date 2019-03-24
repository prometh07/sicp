#lang sicp
(#%require "helpers.rkt")

(define (entry t) (car t))
(define (left-branch t) (cadr t))
(define (right-branch t) (caddr t))
(define (make-tree entry left right) (list entry left right))


(define (tree2list1 t)
  (if (null? t)
    '()
    (append
      (tree2list1 (left-branch t))
      (cons (entry t) (tree2list1 (right-branch t))))))


(define t1
  (make-tree 7
    (make-tree 3
      (make-tree ))
  ))
