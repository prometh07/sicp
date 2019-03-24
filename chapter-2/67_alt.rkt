#lang sicp
(#%require "helpers.rkt")

; leaf defined as a code-tree in which left-branch and right-branch are nil
; this solution could be a little shorter without make-leaf procedure
; (or with make-code-tree and make-leaf merged) but the code would be less readable

(define (leaf? t)
  (eq? (left-branch t) nil))

(define (left-branch t)
  (car t))

(define (right-branch t)
  (cadr t))

(define (symbols t)
  (caddr t))

(define (weight t)
  (cadddr t))

(define (make-code-tree left right)
  (list
    left
    right
    (append (symbols left) (symbols right))
    (+ (weight left) (weight right))))

(define (make-leaf symbol weight)
  (list
    nil
    nil
    (list symbol)
    weight))

(define (decode bits tree)
  (define (choose-branch bit branch)
    (cond
      ((= bit 0) (left-branch branch))
      ((= bit 1) (right-branch branch))
      (else (error "bad bit -- CHOOSE-BRANCH" bit))))
  (define (decode-1 bits current-branch)
    (if (null? bits)
      '()
      (let
        ((next-branch (choose-branch (car bits) current-branch)))
        (if (leaf? next-branch)
          (append (symbols next-branch) (decode-1 (cdr bits) tree))
          (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (adjoin-set x set)
  (cond
    ((null? set) (list x))
    ((< (weight x) (weight (car set))) (cons x set))
    (else (cons (car set) (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
  '()
  (let ((pair (car pairs)))
    (adjoin-set
      (make-leaf (car pair) (cadr pair))
      (make-leaf-set (cdr pairs))))))

(define sample-tree
  (make-code-tree
    (make-leaf 'A 4)
    (make-code-tree
      (make-leaf 'B 2)
      (make-code-tree
        (make-leaf 'D 1)
        (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(log (decode sample-message sample-tree))
