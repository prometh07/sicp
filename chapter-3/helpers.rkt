#lang racket

(define (log sth)
  (display sth)
  (newline))

(define puts log)

(define (avg x y)
  (/ (+ x y) 2.0))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(provide (all-defined-out))
