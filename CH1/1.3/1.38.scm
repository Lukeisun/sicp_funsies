#lang sicp
(#%require racket/trace)
(define (cont-frac n d k)
  (define (frac i)
    (if (= i k)
        (/ (n) (d i))
        (+ (d i)
           (/ (n) (frac (+ i 1))))))
  (/ (n) (frac 0))
  )
;; props to https://mk12.github.io/sicp/exercise/1/3.html
;; i couldn't figure out how to get the 2, 4, 6, 8... pattern here with the 2/3
(+ 2 (cont-frac (lambda () 1.0)
                (lambda (i)
                  (if (= (remainder i 3) 1)
                      (* 2/3 (+ i 2))
                      1
                      ))
                1000))

