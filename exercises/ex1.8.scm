(define (cube-root x)
  (define (cube-root-iter guess)
    (if (good-enough? guess (improve guess))
      guess
      (cube-root-iter (improve guess))))
  (define (good-enough? guess new-guess)
    (< (abs (/ (- new-guess guess) guess)) 0.0001))
  (define (improve guess)
    (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
  (cube-root-iter 1.0))

(cube-root -27)
(cube-root 27)

