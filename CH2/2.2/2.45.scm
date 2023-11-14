#lang sicp
(define right-split (split beside below))
(define up-split (split below beside))
(define (split proc-1 proc-2)
  (lambda (painter n)
    (if (= n 0)
        painer
        (let ((smaller (up-split painter (- n 1))))
          (proc-1 painter (proc-2 smaller smaller))))))
