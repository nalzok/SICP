;;; Exercise 1.35
;;; =============
;;;
;;; A simple application of the `fixed-point` procedure.


;; Brief proof:
;;     The golden ratio is the smaller root of the quadratic equation
;;                          x^2 - x - 1 = 0
;;
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (golden-ratio)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

(newline)
(display (golden-ratio))
;Value: 1.6180327868852458

