#lang sicp
;; the empty set is appended first, as its at the bottom
;; of our recursive call stack. When this happens,
;; s at  that point in the stack looks like (last_element)
;; so our append returns (() (last_element))
;; the call before that, s looks like (n-1, last_element)
;; rest results in the result of the previous stack value
;; now in our map call we are adding in our current element (n-1)
;; to rest which looks like ((n-1) (n-1 last_element)), with our
;; return value being (() (last_element) (n-1) (n-1 last_element))
;; and a similar result for all the elements prior to (n-1)
;; i promise i did not trace this, I just don't know how to explain it more
;; clearly :(
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s)))
            (current (list (car s))))
        (append rest (map (lambda (x)
                            (if (null? x)
                                current
                                (append current x)
                                ))
                          rest)))))
(subsets (list 1 2 3))
