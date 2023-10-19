#lang sicp

(define (square x)
  (* x x))
(define (even? x)
  (= (remainder x 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (- n (+ 1 (random 100))))) ;; got to get a little hacky cause random doesnt like large ints, wont work for small nums

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (search-for-prime i found start-time)
  (cond ((= found 3) (newline) (display (- (runtime) start-time)))
        ((fast-prime? i 1)
         (newline)
         (display i)
         (search-for-prime (+ i 1) (+ found 1) start-time))
        (else (search-for-prime (+ i 1) found start-time))))
;; i have no idea if this is right
;; (search-for-prime 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 0 (runtime))

;; this works dough
(search-for-prime 1000000000000 0 (runtime))


