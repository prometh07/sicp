#lang sicp
(#%require "helpers.rkt")

(define (symbol<? a b)
  (string<? (symbol->string a)
            (symbol->string b)))

(define (make-table)
  (let ((tree nil))
    (define (make-node key val) (list key val nil nil))
    (define (node-key node) (car node))
    (define (node-val node) (cadr node))
    (define (node-left-child node) (caddr node))
    (define (node-right-child node) (cadddr node))
    (define (set-val! node val) (set-car! (cdr node) val))
    (define (set-left-child! node val) (set-car! (cddr node) val))
    (define (set-right-child! node val) (set-car! (cdddr node) val))
    (define (find key)
      (define (iter node)
        (cond
          ((null? node) #f)
          ((equal? key (node-key node)) node)
          ((symbol<? (node-key node) key) (iter (node-right-child node)))
          (else (iter (node-left-child node)))))
      (iter tree))
    (define (insert! key val)
      (define (iter node)
        (cond
          ((equal? key (node-key node)) (set-val! node val))
          ((symbol<? key (node-key node))
            (if (null? (node-left-child node))
              (set-left-child! node (make-node key val))
              (iter (node-left-child node))))
          (else
            (if (null? (node-left-child node))
              (set-right-child! node (make-node key val))
              (iter (node-right-child node))))))
      (if (null? tree)
        (set! tree (make-node key val))
        (iter tree)))
    (define (dispatch method)
      (cond
        ((equal? method 'find) find)
        ((equal? method 'insert!) insert!)
        (else (error "unknown method"))))
    dispatch))

; a more elegant solution uses the adjoin-set method from chapter 2
; another option is to use passing by reference explicitly
; 

(define t (make-table))
((t 'insert!) 'a 1)
(log ((t 'find) 'a))
((t 'insert!) 'b 2)
((t 'insert!) 'a 3)
(log ((t 'find) 'a))
(log ((t 'find) 'b))
