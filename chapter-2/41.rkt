#lang sicp

(define (accumulate op init seq)
  (if (null? seq)
    init
    (op
      (car seq)
      (accumulate op init (cdr seq)))))

(define (flat-map proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval from to)
  (if (> from to)
    nil
    (cons from (enumerate-interval (+ 1 from) to))))

(define (unique-pairs n)
  (flat-map
    (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval (+ 1 i) n)))
    (enumerate-interval 1 n)))

(define (unique-triples n)
  (flat-map
    (lambda (i) (map (lambda (j) (append i (list j))) (enumerate-interval (+ (cadr i) 1) n)))
    (unique-pairs n)))

(define (filter predicate seq)
  (define (iter result rest)
    (cond
      ((null? rest) result)
      ((predicate (car rest)) (iter (append result (list (car rest))) (cdr rest)))
      (else (iter result (cdr rest)))))
  (iter nil seq))

(define (triples n s)
  (define (is-sum? seq) (= s (accumulate + 0 seq)))
  (filter is-sum? (unique-triples n)))

(display (triples 5 8))
