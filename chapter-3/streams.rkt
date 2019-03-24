#lang sicp

(#%provide (all-defined))

(define (stream-car s) (car s))
(define (stream-cdr s) (force (cdr s)))

(define (stream-for-each proc s)
  (if (not (stream-null? s))
    (begin
      (proc (stream-car s))
      (stream-for-each proc (stream-cdr s)))))

(define (display-line x)
  (newline)
  (display x))

(define (display-stream s)
  (stream-for-each display-line s))

(define (stream-enumerate-interval low high)
  (if (> low high)
    the-empty-stream
    (cons-stream
      low
      (stream-enumerate-interval (+ low 1) high))))

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
    the-empty-stream
    (cons-stream
      (apply proc (map stream-car argstreams))
      (apply stream-map (cons proc (map stream-cdr argstreams))))))

(define (stream-ref s n)
  (if (= n 0)
    (stream-car s)
    (stream-ref (stream-cdr s) (- n 1))))

(define (stream-slice s n)
  (if (= n 0)
    nil
    (cons (stream-car s) (stream-slice (stream-cdr s) (- n 1)))))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (mul-streams s1 s2)
  (stream-map * s1 s2))

(define ones (cons-stream 1 ones))
(define integers (cons-stream 1 (add-streams ones integers)))

(define (scale-stream s factor)
  (stream-map (lambda (x) (* x factor)) s))

(define (integrate-series s)
  (define (iter stream denom)
    (cons-stream
      (/ (stream-car stream) denom)
      (iter (stream-cdr stream) (+ denom 1))))
  (iter s 1))

(define exp-series
  (cons-stream 1 (integrate-series exp-series)))

(define (negate s)
  (cons-stream (- (stream-car s)) (negate (stream-cdr s))))

(define cosine-series
  (cons-stream 1 (integrate-series (negate sine-series))))

(define sine-series
  (cons-stream 0 (integrate-series cosine-series)))

(define (mul-series s1 s2)
  (cons-stream
    (* (stream-car s1) (stream-car s2))
    (add-streams
      (scale-stream (stream-cdr s2) (stream-car s1))
      (mul-series (stream-cdr s1) s2))))

(define (partial-sums s)
  (cons-stream (stream-car s) (add-streams (stream-cdr s) (partial-sums s))))

(define (stream-filter fn s)
  (cond
    ((stream-null? s) the-empty-stream)
    ((fn (stream-car s)) (cons-stream (stream-car s) (stream-filter fn (stream-cdr s))))
    (else (stream-filter fn (stream-cdr s)))))

(define (list-to-stream x)
  (if (null? x)
    the-empty-stream
    (cons-stream (car x) (list-to-stream (cdr x)))))
