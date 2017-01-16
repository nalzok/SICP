;;; Exercise 1.37
;;; =============

;; Iterative

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
      result
      (iter (- i 1)
            (/ (n i) (+ (d i) result)))))
  (iter (- k 1) (/ (n k) (d k))))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           9)
;Value: .6181818181818182
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)
;Value: .6179775280898876

;; Exact value: .6180339887

;; `K` must be at least 10 in order to get an approximation that is accurate
;; to 4 decimal places.

;; Recursive

(define (cont-frac n d k)
  (define (recr i)
    (if (= i k)
      (/ (n i) (d i))
      (/ (n i) (* 1.0 
                  (+ (d i) (recr (+ i 1)))))))
  (recr 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           9)
;Value: .6181818181818182
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)
;Value: .6179775280898876

;; Exact value: .6180339887

