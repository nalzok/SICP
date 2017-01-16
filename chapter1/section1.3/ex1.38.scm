;;; Exercise 1.38
;;; =============

; Copied from ex1.37.scm
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
                ; (d i): 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ....
                (lambda (i) (if (= (remainder i 3) 2)
                              (- i (quotient i 3))
                              1))
                1000)))

e
;Value: 2.7182818284590455

