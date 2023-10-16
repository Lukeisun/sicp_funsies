#lang sicp

(define (sqrt-iter guess x)
  (let ((next (improve guess x)))
    (if (good-enough? guess next)
        guess
        (sqrt-iter next x))))
;; "watch how guess changes from one iter to next and stop when 
;; change is is a very small fraction of guess"
(define (good-enough? prev_guess guess)
  (< (abs (/ (- guess prev_guess) guess)) 0.000000000001))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))
(sqrt-iter 1.0 1000000000000000000)
