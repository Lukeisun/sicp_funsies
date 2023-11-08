#lang sicp
(define (square-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree)) (square-tree (cdr tree))))))
(define (square-tree-map tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (square-tree-map subtree)
             (* subtree subtree))) tree))

(define x (list 1
                (list 2 (list 3 4 ) 5)
                (list 6 7)))
(square-tree x)
(square-tree-map x)
