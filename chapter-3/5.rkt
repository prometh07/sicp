#lang sicp

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond
      ((= trials-remaining 0) (/ trials-passed trials))
      ((experiment) (iter (- trials-remaining 1) (+ trials-passed 1)))
      (else (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (estimate-integral predicate x x2 y y2 trials)
  (define (is-point-in-area)
    (predicate (random-in-range x x2) (random-in-range y y2)))
  (/ (monte-carlo trials is-point-in-area) 0.25))

(define (estimate-pi trials)
  (estimate-integral
    (lambda (x y) (<= (+ (* x x) (* y y)) 0.25)) ; (x -cx)^2 + (y - cy)^2 <= R^2 for a circle centered in (0,0) having radius of 0.5
    -0.5 0.5 -0.5 0.5 ; enclosing rectangular corners
    trials))

(* (estimate-pi 1000000) 1.0)
