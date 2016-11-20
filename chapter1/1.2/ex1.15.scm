(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))

;; a. The procedure p is applied 5 times
;; b. Order of growth of space:            theta of log(n)
;;    Order of growth of number of steps:  theta of log(n)
