;;; Exercise 1.39
;;; =============

;; Copied from ex1.37.scm
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
                           (square x)))
             (lambda (i) (if (odd? i)
                           (- (* 2 i) 1)
                           (- 1 (* 2 i))))
             k))


(tan-cf 1 1000)
;Value: 1.5574077246549023

