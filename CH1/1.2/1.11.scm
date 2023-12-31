#lang sicp
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))
(define (iter n)
  (define (func a b c)
    (+ (* 3 a) (* 2 b) c))
  (define (foo a b c count)
    (if (= count 2)
        c
        (foo b c (func a b c) (- count 1))
        )
    )
  (if (< n 3)
      n
      (foo 0 1 2 n))
  )
;; (f 1)
;; (f 2)
;; (f 3)
;; (f 4)
;; (f 5)
(f 36)
(iter 36)
;; (iter 5)
;; (iter 4)
