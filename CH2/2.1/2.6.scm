#lang sicp
(define zero (lambda (f) (lambda (x) x)))
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
;; eval f2 with f and x, then eval f1 with f and the result of the previous
;; could swap f1/f2
(define (+ f1 f2)
  (lambda (f) (lambda (x) ((f1 f) ((f2 f) x)))))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

zero
one
two
((two inc) 0)
((zero inc) 0)
((one inc) 0)
(((add-1 one) inc) 0)
(newline)
(display "Addition time")
(newline)
((+ (one inc) (two inc)) 0)
(((+ two two) inc) 0)
(((+ (+ two two) two) inc) 0)
(((+ one two) inc) 0)
(((+ zero zero) inc) 0)
(((+ one zero) inc) 0)
(((+ one one) inc) 0)
;; pretty proud ! did it mostly my self.
;; I did have a look at this https://billthelizard.blogspot.com/2010/10/sicp-26-church-numerals.html
;; as i was having a hard time figuring out how to test
;; bill outlines it pretty well with his inc and thats the only reference i used
;; lets go.
