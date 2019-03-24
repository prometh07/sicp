#lang sicp
(#%require "helpers.rkt")

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

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? obj)
  (eq? 'leaf (car obj)))

(define (symbol-leaf x)
  (cadr x))

(define (weight-leaf x)
  (caddr x))

(define (make-code-tree left right)
  (list
    left
    right
    (append (symbols left) (symbols right))
    (+ (weight left) (weight right))))

(define (left-branch t)
  (car t))

(define (right-branch t)
  (cadr t))

(define (symbols t)
  (if (leaf? t)
    (list (symbol-leaf t))
    (caddr t)))

(define (weight t)
  (if (leaf? t)
    (weight-leaf t)
    (cadddr t)))

(define (generate-huffman-tree pairs)
  (define (successive-merge nodes)
    (if (eq? (length nodes) 1)
      (car nodes)
      (successive-merge (adjoin-set (make-code-tree (car nodes) (cadr nodes)) (cddr nodes)))))
  (successive-merge (make-leaf-set pairs)))

(log (generate-huffman-tree (list '(A 4) '(D 1) '(C 1) '(B 2))))
