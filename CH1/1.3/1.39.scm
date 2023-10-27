#lang sicp
(define (cont-frac n d k)
  (define (frac i)
    (if (= i k)
        (/ (n i) (d i))
        (+ (d i)
           (/ (n i) (frac (+ i 1))))))
  (/ (n 0) (frac 1))
  )

(define (tan-cf x k)
  (cont-frac
   (lambda (i)
     (if (= i 0)
         x
         (- (* x x))
         )
     )
   (lambda (i) (- (* 2 i) 1 ))
   k))
;; we pretend like I couldn't get the iterative solution working :)
(tan-cf 1.0 10)
(tan-cf 2.0 10000)
(tan-cf 0.785398163 6)

