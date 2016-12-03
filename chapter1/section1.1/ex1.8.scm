;;; Exercise 1.8
;;; ============
;;;

(define (cube-root-iter guess x)
  (if (good-enough? guess (improve guess x))
    guess
    (cube-root-iter (improve guess x) x)))

(define (good-enough? guess new-guess)
  (< (abs (/ (- new-guess guess) guess)) 0.0001))

(define (improve guess x)
  (/ (+ (/ x guess guess) (* 2 guess)) 3))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 27)
;Value: 3.0000005410641766
(cube-root -27)
;Value: -3.0001270919925287

