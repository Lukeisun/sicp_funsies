#lang sicp
(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

(define make-vect cons)
(define xcor-vect car)
(define ycor-vect cdr)
(define u (make-vect 10 20))
(define v (make-vect 2 3))

(define seg (make-segment v u))
(start-segment seg)
(end-segment seg)
