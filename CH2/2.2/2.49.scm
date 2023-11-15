#lang sicp
(#%require sicp-pict)
;; for the rest of the exercises I will just use what
;; is given with the racket pict lang package :(
(define outline
  (segments->painter
   (list
    (make-segment (make-vect 0 0)
                  (make-vect 0 1))
    (make-segment (make-vect 0 1)
                  (make-vect 1 1))
    (make-segment (make-vect 1 1)
                  (make-vect 1 0))
    (make-segment (make-vect 1 0)
                  (make-vect 0 0)))))
;; b
(define x-painter
  (segments->painter
   (list
    (make-segment (make-vect 0 0)
                  (make-vect 1 1))
    (make-segment (make-vect 0 1)
                  (make-vect 1 0)))))
;; c
(define diamond
  (segments->painter
   (list
    (make-segment (make-vect 0.5 0)
                  (make-vect 0 0.5))
    (make-segment (make-vect 0 0.5)
                  (make-vect 0.5 1))
    (make-segment (make-vect 0.5 1)
                  (make-vect 1 0.5))
    (make-segment (make-vect 1 0.5)
                  (make-vect 0.5 0))
    )))
;; d
(define wave
  (vects->painter
   (list
    (make-vect 0 0.75)
    (make-vect 0.2 0.6)
    (make-vect 0.4 0.6)
    (make-vect 0.3 0.75)
    (make-vect 0.4 1)
    (make-vect 0.6 1)
    (make-vect 0.65 0.75)
    (make-vect 0.6 0.6)
    (make-vect 0.75 0.6)
    (make-vect 1 0.4)
    (make-vect 1 0.2)
    (make-vect 0.6 0.4)
    (make-vect 0.65 0)
    (make-vect 0.5 0)
    (make-vect 0.4 0.25)
    (make-vect 0.3 0)
    (make-vect 0.2 0)
    (make-vect 0.35 0.4)
    (make-vect 0.3 0.5)
    (make-vect 0.2 0.4)
    (make-vect 0 0.6)
    (make-vect 0 0.75)
    )))
(paint outline)
(paint x-painter)
(paint diamond)
(paint wave)
