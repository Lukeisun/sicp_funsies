#lang sicp
(#%require sicp-pict)
(define (below painter1 painter2)
  (let* ((split-point (make-vect 0 0.5))
         (paint-bottom (transform-painter painter1
                                          (make-vect 0 0)
                                          (make-vect 1 0)
                                          split-point))
         (paint-top (transform-painter painter2
                                       split-point
                                       (make-vect 1 0.5)
                                       (make-vect 0 1))))
    (lambda (frame)
      (paint-bottom frame)
      (paint-top frame))))
(define (rotate90 painter)
  (transform-painter painter
                     (make-vect 1 0)
                     (make-vect 1 1)
                     (make-vect 0 0)))
(define (rotate180 painter)
  (transform-painter painter
                     (make-vect 1 1)
                     (make-vect 0 1)
                     (make-vect 1 0)))
(define (rotate270 painter)
  (transform-painter painter
                     (make-vect 0 1)
                     (make-vect 0 0)
                     (make-vect 1 1)))
(define (below-2 painter1 painter2)
  (rotate90 (beside (rotate270 painter1) (rotate270 painter2))))
(define x (below einstein (escher)))
(paint x)
(paint (below einstein einstein))
(define y (below-2 einstein einstein))
(paint y)
;; (paint ((below einstein einstein) (make-frame (make-vect 0 0) (make-vect 1 0) (make-vect 0 1))))
