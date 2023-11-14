#lang sicp
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter(- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painer (- n 1)))))
        (beside (below painter top-left)
                (below bottom-right corner)))))
(define (up-split painter n)
  (if (= n 0)
      painer
      (let ((smaller (up-split painter (- n 1))))
        (below painer (beside smaller smaller)))))
(define (right-split painter n)
  (if (= n 0)
      painer
      (let ((smaller (up-split painter (- n 1))))
        (beside painter (below smaller smaller)))))
;; (define (beside painter1 painter2)
;;   (let ((split-point (make-vect 0.5 0.0)))
;;     (let ((paint-left
;;             (transform-painter
