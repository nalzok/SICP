;;; Exercise 1.43
;;; =============

; Directly copied from ex1.42.scm

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
    f
    (compose f (repeated f (- n 1)))))

((repeated square 2) 5)
;Value: 625

