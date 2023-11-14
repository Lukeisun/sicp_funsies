#lang sicp
(define make-vect cons)
(define xcor-vect car)
(define ycor-vect cdr)
(define (add-vect u v)
  (let ((ux (xcor-vect u))
        (uy (ycor-vect u))
        (vx (xcor-vect v))
        (vy (ycor-vect v)))
    (make-vect (+ ux vx) (+ uy vy))))
(define (negate-vec v)
  (make-vect (- (xcor-vect v)) (- (ycor-vect v))))
(define (sub-vect u v)
  (add-vect u (negate-vec v)))
(define (scale-vect v s)
  (make-vect (* s (xcor-vect v)) (* s (ycor-vect v))))
(define u (make-vect 10 20))
(define v (make-vect 2 3))
(add-vect u v) ;; 12 23
(sub-vect u v) ;; 8 17
(sub-vect v u) ;; -8 -17
(scale-vect u 2) ;; 20 40
(scale-vect v 3) ;; 6 9

