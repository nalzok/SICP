;;; Exercise 1.42
;;; =============
;;;
;;; A tool for exercise 1.43.



(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc x)
  (+ x 1))

(newline)
(display ((compose square inc) 6))
;Value: 49

