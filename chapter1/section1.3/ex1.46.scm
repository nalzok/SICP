;;; Exercise 1.46
;;; =============

(define (iterative-improve good-enough? improve)
  (lambda (first-guess)
    (define (iter guess)
      (let ((next (improve guess)))
       (if (good-enough? guess next)
         next
         (iter next))))
    (iter first-guess)))

; sqrt

(define (sqrt x)
  (define tolerance 0.00001)
  (define (good-enough? guess new-guess)
    (< (abs (/ (- guess new-guess) guess)) tolerance))
  (define (improve-guess guess)
    (/ (+ guess (/ x guess)) 2.0))
  ((iterative-improve good-enough? improve-guess) 1))

(sqrt 5.0)
;Value: 2.236067977499978

; fixed-point

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (improve x)
    (f x))
  ((iterative-improve close-enough? improve) first-guess))

(fixed-point cos 1.0)
;Value: .7390822985224023

