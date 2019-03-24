#lang sicp
(#%require "helpers.rkt")

(define (make-tree elem left right)
  (list elem left right))
(define (left-branch t) (cadr t))
(define (right-branch t) (caddr t))
(define (entry t) (car t))

(define (get-key e) (car e))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

(define (lookup key set)
  (cond
    ((null? set) false)
    ((= key (get-key (entry set))) (entry set))
    ((< key (get-key (entry set))) (lookup key (left-branch set)))
    ((> key (get-key (entry set))) (lookup key (right-branch set)))))

(define employers (list->tree (list (list 1 "john") (list 2 "doe") (list 3 "bill"))))

(log (lookup 2 employers))
(log (lookup 13 employers))
