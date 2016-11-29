;;; Exercise 1.43
;;; =============
;;;
;;; A more general version of the `double` procedure in exercise 1.41.
;;;
;;; Preparation for exercise 1.44 - 1.45.



;; Without `compose`
;;
(define (repeated f n)
  (if (= n 1)
    f
    (lambda (x) (f ((repeated f (- n 1)) x)))))

(newline)
(display ((repeated square 2) 5))
;Value: 625

;; With `compose`
;;
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
    f
    (compose f (repeated f (- n 1)))))

(newline)
(display ((repeated square 2) 5))
;Value: 625

