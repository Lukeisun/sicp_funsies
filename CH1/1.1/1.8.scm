#lang sicp

(define (cube-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (cube-iter (improve guess x) x)))
;; "watch how guess changes from one iter to next and stop when 
;; change is is a very small fraction of guess"
(define (good-enough? prev_guess guess)
  (< (abs (/ (- guess prev_guess) guess)) 0.000000000000001))

(define (improve guess x)
  (/
   (+ (* 2 guess) (/ x (* guess guess)))
   3))
(cube-iter 1.0 270000000000)
