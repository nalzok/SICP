;;; Exercise 1.31
;;; =============

; Recursive

(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

;; Iterative

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a)
            (* (term a)
               result))))
  (iter a 1))

(define (factorial n)
  (define (identity i) i)
  (define (inc i) (+ i 1))
  (product identity 1 inc n))

(factorial 5)
;Value: 120

(define (pi-prod n)
  (define (pi-term i)
    (cond ((even? i) (/ (+ i 2) (+ i 1)))
          (else  (/ (+ i 1) (+ i 2)))))
  (define (pi-next i)
    (+ i 1))
  (* (product pi-term 1 pi-next n) 4.0))

(pi-prod 1000)
;Value: 3.1431607055322663

