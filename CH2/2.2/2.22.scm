#lang sicp
(define (square x) (* x x))
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square
                     (car things))))))
  (iter items nil))
;; this is reversed because we append an item as we see/process it.
;; We dont see this in the recursion as we say that "I want to declare cons
;; with this processed element (car) and the result of this function with the rest of the elements (cdr).
;; i ran into this a few exercises ago and I think i got my head wrapped around it now.
(square-list (list 1 2 3 4 5))
;; this doesn't work as our value part of the returned list (car), is the answer list so our first pass of this
;; looks like (cons '() (car things)). The cdr part 
;; is the actual value so this returns (((((() . 1) . 4) . 9) . 16) . 25).
(square-list-2 (list 1 2 3 4 5))
