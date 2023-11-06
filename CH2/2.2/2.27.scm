#lang sicp
(define x (list (list 1 2) (list 3 4)))
;; struggled but what was my wall was moving the null check
;; outside of the let xd
(define (deep-reverse li)
  (define (iter things answer)
    (if (null? things)
        answer
        (let* ((thing (car things))
               (value (if (pair? thing) (deep-reverse thing) thing)))
          (iter (cdr things) (cons value answer)))))
  (iter li '()))
(define y (list (list 1 2 (list 5 6)) (list 3 4)))
(deep-reverse x)
(deep-reverse y)
