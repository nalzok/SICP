;;; Exercise 1.37
;;; =============
;;;
;;; You must make `k` at least 10 to get an approximation that is accurate
;;; to 4 decimal places when checking your procedure by approximating the
;;; reciprocal of the golden ratio.



;; Recursive version
;;
(define (cont-frac n d k)
  (define (recr i)
    (if (= i k)
      (/ (n i) (d i))
      (/ (n i) (* 1.0 
                  (+ (d i) (recr (+ i 1)))))))
  (recr 1))

;; Iterative version
;;
(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
      (* result 1.0)
      (iter (- i 1)
            (/ (n i) (+ (d i) result)))))
  (iter (- k 1) (/ (n k) (d k))))


(newline)
(display (cont-frac (lambda (i) 1)
                    (lambda (i) 1)
                    10))
;Value: .6179775280898876
;Exact value: .6180339887

