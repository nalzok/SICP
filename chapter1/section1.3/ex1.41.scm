;;; Exercise 1.41
;;; =============
;;;
;;; I don't think anybody would write such complicated code in the real
;;; world, so just consider this exercise as an exercise.



(define (double f)
  (lambda (x) (f (f x))))

(define (inc x)
  (+ x 1))

(newline)
(display ((double inc) 0))
;Value: 2

(newline)
(display (((double (double double)) inc) 5))
;Value: 21
;
;    ((double (double double)) inc)
; -> ((double (lambda (x) (f (f (f (f x)))))) inc)
; -> ((lambda (x) (f (f (f (f (f (f (f (f x))))))))) inc)
; -> (f (f (f (f (f (f (f (f inc))))))))

