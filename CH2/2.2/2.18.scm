#lang sicp
(#%require racket/trace)
(define (append l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2))))
;; my very "well" put together answer
(define (reverse li)
  (define (rev l r)
    (if (null? (cdr l))
        (append (list (car l)) r)
        (rev (cdr l) (append (list (car l)) r))))
  (rev li (list)))
;; saw some solutions that looked like this, a lot cleaner than mine
(define (reverse-2 li)
  (if (null? li)
      (list)
      (append (reverse-2 (cdr li)) (list (car li)))))
;; pulled from https://mk12.github.io/sicp/exercise/2/2.html
;; this guy really is a wizard, I have no idea how or why this works.
;; lets trace, ok i get it now but this took me a lot longer than
;; it should have
(define (reverse-12 xs)
  (define (iter xs ys)
    (display ys)
    (if (null? xs)
        ys
        (iter (cdr xs)
              (cons (car xs) ys))))
  (trace iter)
  (iter xs '()))
(reverse (list 1 4 9 16 25))
(reverse-2 (list 1 4 9 16 25))
(reverse-12 (list 1 4 9 16 25))
