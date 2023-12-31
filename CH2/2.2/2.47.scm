#lang sicp
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))
(define (make-frame-cons origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame frame)
  (car frame))
(define (edge1-frame frame)
  (cadr frame))
(define (edge2-frame frame)
  (caddr frame))

(define (origin-frame-cons frame)
  (car frame))
(define (edge1-frame-cons frame)
  (cadr frame))
(define (edge2-frame-cons frame)
  (cddr frame))

(define x (make-frame 1 2 3))
(origin-frame x)
(edge1-frame x)
(edge2-frame x)
(define y (make-frame-cons 1 2 3))
(origin-frame-cons y)
(edge1-frame-cons y)
(edge2-frame-cons y)
