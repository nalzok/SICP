;;; Exercise 1.32
;;; =============
;;;
;;; `Accumulate` is a higher-level abstraction. We are building abstractions
;;; by replacing "magic numbers" and "magic procedures" with parameters.



;; Recursive version
;;
(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a) (accumulate
                        combiner
                        null-value
                        term
                        (next a)
                        next
                        b))))
    
;; Iterative version
;;
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))))
  (iter a null-value))

;; `sum`
;;
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(newline)
(display (* 8 (pi-sum 1 1000)))
;Value: 3.139592655589782

;; `produce`
;;
(define (product term a next b)
  (accumulate * 1 term a next b))

(define (pi-prod n)
  (define (pi-term i)
    (cond ((even? i) (/ (+ i 2) (+ i 1)))
          (else  (/ (+ i 1) (+ i 2)))))
  (define (pi-next i)
    (+ i 1))
  (* (product pi-term 1 pi-next n) 4.0))

(newline)
(display (pi-prod 1000))
;Value: 3.1431607055322663

