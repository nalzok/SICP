;;; Exercise 1.8
;;; ============
;;;
;;; The instruction points out that the cube-root procedure is "analogous
;;; to the square-root procedure", which means you can do this exercise by
;;; making some minor modifications to the square-root procedure.



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

(newline)
(display (cube-root 27))
;Value: 3.0000005410641766
(newline)
(display (cube-root -27))
;Value: -3.0001270919925287

