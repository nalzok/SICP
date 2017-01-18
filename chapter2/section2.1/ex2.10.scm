;;; Exercise 2.10
;;; =============

(define (make-interval a b) (cons a b))
(define (upper-bound x) (max (car x) (cdr x)))
(define (lower-bound x) (min (car x) (cdr x)))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (div-interval x y)
  (if (> (* (lower-bound y) (upper-bound y)) 0)
    (mul-interval x 
                  (make-interval (/ 1.0 (upper-bound y))
                                 (/ 1.0 (lower-bound y))))
    (error "Divide by an interval that spans zero")))
(define (print-interval x)
  (newline)
  (display "[")
  (display (lower-bound x))
  (display ",")
  (display (upper-bound x))
  (display "]"))

(define i1 (make-interval 1 3))
(define i2 (make-interval 2 4))
(define i (div-interval i1 i2))

(print-interval i)
;[.25,1.5]

(define i1 (make-interval 1 3))
(define i2 (make-interval -2 4))
(define i (div-interval i1 i2))
;Divide by an interval that spans zero
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.

