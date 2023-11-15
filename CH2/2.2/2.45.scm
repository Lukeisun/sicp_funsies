#lang sicp
(define right-split (split beside below))
(define up-split (split below beside))
(define (split proc-1 proc-2)
  (define (ret-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (ret-split painter (- n 1))))
          (proc-1 painter (proc-2 smaller smaller)))))
  ret-split)
