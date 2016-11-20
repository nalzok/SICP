;;; Exercise 1.6
;;; ============
;;; 
;;; When using applicative-order evaluation, __every__ argument is 
;;; evaluated before further expansion. As a result, evaluating 
;;; any recursive procedure would cause infinite recursion.

(define (square x)
  (* x x))

(define (abs x)
  (if (< x 0)
    (- x)
    x))

(define (new-if predicate
            then-clause
            else-clause
        )
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(display "\n")
(display (sqrt 42))
;Value: 6.480740727643494

