;;; Exercise 1.6
;;; ============
;;; 

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
  (new-if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2.0))

(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 42)
;Value: ;Aborting!: maximum recursion depth exceeded

; In the evaluation of the special form `if`, only one of `<consequent>` and
; `<alternative>` would be evaluated. In this case, when `(good-enough? guess
; x)` computes to #t, `sqrt-iter` won't be called, which ends the expansion..
;
; `New-if`, however, is a precedure, which is dealt with applicative-order
; evaluation, where EVERY argument is evaluated before further expansion. As
; a result, regardless of what `(good-enough? guess x)` yields, `sqrt-iter`
; would always be called by itself, causing infinite recursion.
;
; Also note that using normal-order evaluation would also result in infinite
; recursion, because all arguments are still evaluated before further
; expansion. In fact, I can't see any difference between applicative-order and
; normal-order evaluation in this case.

