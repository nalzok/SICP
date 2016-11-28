;;; Exercise 1.38
;;; =============
;;;
;;; Thanks to _De Fractionibus Continuis_ by Leonhard Euler, we can now use
;;; our `cont-frac` procedure to compute the base of the natural logarithms.



;; Taken from ex1.37.scm
;;
(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
      (* result 1.0)
      (iter (- i 1)
            (/ (n i) (+ (d i) result)))))
  (iter (- k 1) (/ (n k) (d k))))

(define e
  (+ 2
     (cont-frac (lambda (i) 1)
                (lambda (i) (if (= (remainder i 3) 2)
                              (- i (quotient i 3))
                              1))
                1000)))


(newline)
(display e)
;Value: 2.7182818284590455

