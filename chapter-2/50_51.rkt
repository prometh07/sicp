#lang sicp
(#%require graphics/graphics)
(open-graphics)
; pict lang tips from https://ericscrivner.me/2015/05/the-sicp-picture-language-in-racket/

(define vp (open-viewport "A Picture Language" 1000 1000))

(define (make-vect x y) (cons x y))
(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))
(define (add-vect v1 v2)
  (make-vect
    (+ (xcor-vect v1) (xcor-vect v2))
    (+ (ycor-vect v1) (ycor-vect v2))))
(define (sub-vect v1 v2)
  (make-vect
    (- (xcor-vect v1) (xcor-vect v2))
    (- (ycor-vect v1) (ycor-vect v2))))
(define (scale-vect s v)
  (make-vect (* s (xcor-vect v))
             (* s (ycor-vect v))))

(define (make-frame origin edge1 edge2) (list origin edge1 edge2))
(define (origin-frame frame) (car frame))
(define (edge1-frame frame) (cadr frame))
(define (edge2-frame frame) (caddr frame))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))


(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define draw (draw-viewport vp))
(define (clear) ((clear-viewport vp)))
(define line (draw-line vp))

(define unit-frame (make-frame (make-vect 300 700) (make-vect 300 00) (make-vect 0 -350)))

(define (segments->painter segment-list)
 (lambda (frame)
   (for-each
    (lambda (segment)
      (let ((start-coord-map ((frame-coord-map frame) (start-segment segment)))
            (end-coord-map ((frame-coord-map frame) (end-segment segment))))
      (line
       (make-posn (xcor-vect start-coord-map) (ycor-vect start-coord-map))
       (make-posn (xcor-vect end-coord-map) (ycor-vect end-coord-map)))))
    segment-list)))

(define outline-painter
  (segments->painter
    (list
      (make-segment (make-vect 0 0) (make-vect 1 0))
      (make-segment (make-vect 0 1) (make-vect 1 1))
      (make-segment (make-vect 0 0) (make-vect 0 1))
      (make-segment (make-vect 1 0) (make-vect 1 1)))))

(define x-painter
  (segments->painter
    (list
      (make-segment (make-vect 0 0) (make-vect 1 1))
      (make-segment (make-vect 0 1) (make-vect 1 0)))))

(define liner (segments->painter (list (make-segment (make-vect 0 0) (make-vect 1 1)))))

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter
          (make-frame new-origin
            (sub-vect (m corner1) new-origin)
            (sub-vect (m corner2) new-origin)))))))

(define (flip-horiz painter)
  (transform-painter painter
    (make-vect 1 0)
    (make-vect 0 0)
    (make-vect 1 1)))

(define (flip-vert painter)
  (transform-painter painter
    (make-vect 0 1)
    (make-vect 0 0)
    (make-vect 1 1)))

(define (rotate90 painter)
  (transform-painter painter
    (make-vect 1 0)
    (make-vect 1 1)
    (make-vect 0 0)))

(define (rotate180 painter)
  (rotate90 (rotate90 painter)))

(define (rotate270 painter)
  (rotate90 (rotate180 painter)))

(outline-painter unit-frame)
(liner unit-frame)
;((flip-horiz liner) unit-frame)
;((rotate180 liner) unit-frame)
;((rotate270 liner) unit-frame)

; 2.51
(define (beside p1 p2)
  (let ((split-point (make-vect 0.5 0)))
    (let ((right (transform-painter p2 split-point (make-vect 1 0) (make-vect 0.5 1)))
          (left (transform-painter p1 (make-vect 0 0) split-point (make-vect 0 1))))
    (lambda (frame) (left frame) (right frame)))))


(define (below1 p1 p2)
  (let ((split-point (make-vect 0 0.5)))
    (let ((up (transform-painter p1 split-point (make-vect 0 1) (make-vect 1 0.5)))
          (down (transform-painter p2 (make-vect 0 0) split-point (make-vect 1 0))))
    (lambda (frame) (up frame) (down frame)))))

(define (below2 p1 p2)
  (flip-horiz (rotate90 (beside p1 p2))))

((below1 liner liner) unit-frame)
((below2 liner liner) unit-frame)
