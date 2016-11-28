;;; Exercise 1.39
;;; =============
;;;
;;; Thanks to Lambert's formula, we can now use our `cont-frac` procedure
;;; to compute an approximation to the tangent function. This exercise,
;;; along with exercise 1.38, demonstrates the importance of mathematics.



;; Taken from ex1.37.scm
;;
(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
      (* result 1.0)
      (iter (- i 1)
            (/ (n i) (+ (d i) result)))))
  (iter (- k 1) (/ (n k) (d k))))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1)
                           x
                           (* x x)))
             (lambda (i) (if (= (remainder i 2) 1)
                           (- (* 2 i) 1)
                           (- 1 (* 2 i))))
             k))


(newline)
(display (tan-cf 1 1000))
;Value: 1.5574077246549023

