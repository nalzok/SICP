;;; Exercise 1.30
;;; =============
;;;
;;; Such conversion is easy but fruitful, bacause Scheme provides tail-call
;;; optimization.

(define (sum term a next b)
  (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ result
                              (term a)))))
  (iter a 0))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(newline)
(display (* 8 (pi-sum 1 1000)))
;Value: 3.139592655589782

