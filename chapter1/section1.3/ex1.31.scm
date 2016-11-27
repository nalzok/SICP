;;; Exercise 1.31
;;; =============
;;;
;;; 1. Change the `+` and `0` in `sum` to `*` and `1`, respectively.
;;; 2. Give proper names to the procedure and its parameters. 
;;;
;;; That's all what you need to do.


;; Recursive version
;;
(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

;; Iterative version
;;
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result
                        (term a)))))
  (iter a 1))

(define (factorial n)
  (define (identity i) i)
  (define (inc i) (+ i 1))
  (product identity 1 inc n))

(newline)
(display (factorial 5))
;Value: 120

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

