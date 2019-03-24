#lang sicp
(#%require "helpers.rkt")

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
          (cons (symbol-leaf next-branch) (decode-1 (cdr bits) tree))
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

(define (encode message tree)
  (if (null? message)
    '()
    (append
      (encode-symbol (car message) tree)
      (encode (cdr message) tree))))

(define (find x array)
  (cond
    ((null? array) #f)
    ((eq? (car array) x) #t)
    (else (find x (cdr array)))))

(define (encode-symbol symbol tree)
  (define (includes-symbol? node)
    (find symbol (symbols node)))
  (cond
    ((null? tree)
      (error "encoding tree is empty"))
    ((leaf? tree)
      '())
    ((includes-symbol? (left-branch tree))
      (append (list 0) (encode-symbol symbol (left-branch tree))))
    ((includes-symbol? (right-branch tree))
      (append (list 1) (encode-symbol symbol (right-branch tree))))
    (else
      (error "symbol not found in tree"))))

(define encoded-message (encode (decode sample-message sample-tree) sample-tree))

(equal? sample-message encoded-message)
