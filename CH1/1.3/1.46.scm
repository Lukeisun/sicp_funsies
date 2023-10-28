#lang sicp
(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess (improve guess))
        guess
        ((iterative-improve good-enough? improve) (improve guess))
        )))

(define (sqrt x)
  (define (good-enough? prev_guess guess)
    (< (abs (/ (- guess prev_guess) guess)) 0.0000001))
  (define (average x y)
    (/ (+ x y) 2))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))

(define (fixed-point f first_guess)
  (define (good-enough? prev_guess guess)
    (< (abs (- prev_guess guess)) 0.000001))
  (define (improve guess)
    (f guess))
  ((iterative-improve good-enough? improve) first_guess))
(sqrt 2)
(sqrt 64)
(sqrt 16)
(sqrt 100)
(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0) ;; 4.5
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
