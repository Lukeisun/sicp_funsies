#lang sicp

(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a (* x x)) (* b x) c)))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (deriv g)
  (let ((dx 0.00001))
    (lambda (x) (/ (- (g (+ x dx)) (g x)) dx))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (let ((tolerance .00001)) (< (abs (- v1 v2)) tolerance)))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(newtons-method (cubic 2 1 5) 1.0)
(newtons-method (cubic -3 10 1) 1.0)
