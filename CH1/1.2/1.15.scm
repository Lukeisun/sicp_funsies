#lang sicp
(define (cube x) (* x x x))
(define (p x)
  (newline)
  (display "P")
  (- (* 3 x) (* 4 (cube x))))
(define (sine ang)
  (if (not (> (abs ang) 0.1))
      ang
      (p (sine (/ ang 3.0)))))
(sine 12.15)
;; P is applied 5 times when ang = 12.15
(sine 300000)
;; not quite sure how to apply complexity here
