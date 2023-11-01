#lang sicp
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(define (make-rat n d)
  (let ((g (gcd n d))
        (num (abs n))
        (denom (abs d)))
    (if (or (and (< n 0) (< d 0)) (and (>= n 0 ) (>= d 0)))
        (cons (/ num g) (/ denom g))
        (cons (- (/ num g)) (/ denom g)))))

(define (numer x) (car x))
(define (denom x) (cdr x))
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
(define x1 (make-rat -1 -3))
(define x2 (make-rat 2 -3))
(define x3 (make-rat 2 3))
(define x4 (make-rat -2 3))
(define x5 (make-rat 5 10))
(define x6 (make-rat 5 -10))
(print-rat x1)
(print-rat x2)
(print-rat x3)
(print-rat x4)
(print-rat x5)
(print-rat x6)