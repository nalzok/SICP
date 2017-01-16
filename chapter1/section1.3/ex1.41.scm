;;; Exercise 1.41
;;; =============

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x)
  (+ x 1))

((double inc) 5)
;Value: 7

(((double double) inc) 5)
;Value: 9

((((double double) double) inc) 5)
;Value: 21

(((double (double double)) inc) 5)
;Value: 21

