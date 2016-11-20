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
(sqrt 1e100)
