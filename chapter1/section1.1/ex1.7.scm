;;; Exercise 1.7
;;; ============
;;;

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

(sqrt 1e-100)
;Value: 1.000000633105179e-50
(sqrt 1e100)
;Value: 1.000000633105179e50

; On one hand, for very large numbers, since real machines only have finite
; precision, the difference between `(square guess)` and `x` may always be
; greater than 0.001, cauing infinite recursion. Consider an extreme case
; where the machine can only present integers. When calculating the square
; root of 42, you can see that (square 6) is less than 41, and (square 7)
; is greater than 43.
;
; On the other hand, for very small numbers, `(< (abs (- (square guess) x)) 
; 0.001)` could be reached easily, making the result inaccurate. For example.
;
; Our new `good-enough?` procedure, however, don't have this problem. This is
; because the recursion would end automatically once the change of `guess`
; between iterations becomes marginal.

