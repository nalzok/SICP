;;; Exercise 1.7
;;; ============
;;;
;;; On one hand, for very large numbers, the difference between `(square
;;; guess)` and `x` can always be greater than 0.001, cauing infinite 
;;; recursion. On the other hand, for very small numbers, `(< (abs 
;;; (- (square guess) x)) 0.001)` would be a fairly low standard which
;;; can be reached easily.



(define (square x)
  (* x x))

(define (abs x)
  (if (< x 0)
    (- x)
    x))

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess new-guess)
  (< (abs (/ (- guess new-guess) guess)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(newline)
(display (sqrt 1e-100))
;Value: 1.000000633105179e-50
(newline)
(display (sqrt 1e100))
;Value: 1.000000633105179e50

