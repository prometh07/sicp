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
    (lambda (i) (map (lambda (j) (list j i)) (enumerate-interval 1 (- i 1))))
    (enumerate-interval 2 n)))

(define (smallest-divisor n)
  (define (divides? a b) (= 0 (remainder a b)))
  (define (next d) (if (= d 2) 3 (+ d 2)))
  (define (find-divisor d)
    (cond
      ((< n (* d d)) n)
      ((divides? n d) d)
      (else (find-divisor (next d)))))
  (find-divisor 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (filter predicate seq)
  (define (iter result rest)
    (cond
      ((null? rest) result)
      ((predicate (car rest)) (iter (append result (list (car rest))) (cdr rest)))
      (else (iter result (cdr rest)))))
  (iter nil seq))

(define (prime-sum-pairs n)
  (map make-pair-sum (filter prime-sum? (unique-pairs n))))

(display (prime-sum-pairs 6))
