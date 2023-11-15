#lang sicp
(#%require sicp-pict)
(define wave
  (vects->painter
   (list
    (make-vect 0 0.75)
    (make-vect 0.2 0.6)
    (make-vect 0.4 0.6)
    (make-vect 0.3 0.75)
    (make-vect 0.4 1)
    (make-vect 0.6 1)
    (make-vect 0.65 0.75)
    (make-vect 0.6 0.6)
    (make-vect 0.75 0.6)
    (make-vect 1 0.4)
    (make-vect 1 0.2)
    (make-vect 0.6 0.4)
    (make-vect 0.65 0)
    (make-vect 0.5 0)
    (make-vect 0.4 0.25)
    (make-vect 0.3 0)
    (make-vect 0.2 0)
    (make-vect 0.35 0.4)
    (make-vect 0.3 0.5)
    (make-vect 0.2 0.4)
    (make-vect 0 0.6)
    (make-vect 0 0.75)
    )))
(define smile
  (segments->painter
   (list
    (make-segment (make-vect 0.4 0.4) (make-vect 0.4 0.5))
    (make-segment (make-vect 0.55 0.4) (make-vect 0.55 0.5))
    (make-segment (make-vect 0.35 0.3) (make-vect 0.5 0.25))
    (make-segment (make-vect 0.5 0.25) (make-vect 0.6 0.3)))))
(define (split proc-1 proc-2)
  (define (ret-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (ret-split painter (- n 1))))
          (proc-1 painter (proc-2 smaller smaller)))))
  ret-split)


(define right-split (split beside below))
(define up-split (split below beside))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter
                                (- n 1))))
        (let ((top-left up)
              (bottom-right right)
              (corner (corner-split painter
                                    (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right
                         corner))))))

(define (square-limit painter n)
  (let ((combine-4 (square-of-four flip-vert rotate180 identity flip-horiz)))
    (combine-4 (corner-split painter n))))
(paint (corner-split (superpose smile wave) 4) #:width 500 #:height 500)
(paint (square-limit (superpose smile wave) 4) #:width 500 #:height 500)
