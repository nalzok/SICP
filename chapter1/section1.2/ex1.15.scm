;;; Exercise 1.15
;;; =============
;;;
;;; a. The procedure p is applied 5 times
;;;    ----------------------------------
;;;    12.15
;;; -> 4.05
;;; -> 1.3499999999999999
;;; -> .44999999999999996
;;; -> .15
;;; -> 4.9999999999999996e-2
;;;
;;; b. Order of growth of space: theta of log(n)
;;;    -----------------------------------------
;;;    More accurately, it's theta of log_3(n)
;;;
;;;    Order of growth of number of steps: theta of log(n)
;;;    ---------------------------------------------------
;;;    Similarly, it's also theta of log_3(n)



(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))

(newline)
(display (sine 12.15))
;Value: -.39980345741334

