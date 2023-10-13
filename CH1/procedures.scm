#lang sicp
(define (sum-cubes a b)
  (sum cube a inc b))
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))
(define (cube x)
  (* x x x))
(sum-cubes 1 2)
