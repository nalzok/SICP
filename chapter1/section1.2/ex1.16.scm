;;; Exercise 1.16
;;; =============
;;;
;;; The authors of SICP have already provided a hint. To make it a little
;;; more clear: b^n equals (b^2)^(n/2) if n is even, or b*(b^(n-1)) is n
;;; is odd if n is odd.



(define (fast-expt b n)
  (define (even? n)
    (= (remainder n 2) 0))
  (define (square num)
    (* num num))
  (define (expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (expt-iter (square b) (/ n 2) a))
          (else (expt-iter b (- n 1) (* a b)))))
  (expt-iter b n 1))

(newline)
(display (fast-expt 2 10))
;Value: 1024

