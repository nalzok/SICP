;;; Exercise 1.12
;;; =============
;;;
;;; The recursive solution uses the direct definition of Pascal's triangle,
;;; while the iterative one takes advantage of binomial theorem.



;; Recursive method
;; ----------------
;;
(define (pascal-item-recursive m n)
  (cond ((= n 1) 1)
        ((= n m) 1)
        (else (+ (pascal-item-recursive (- m 1) (- n 1))
                 (pascal-item-recursive (- m 1) n)))))

(newline)
(display (pascal-item-recursive 4 2))
;Value: 3


;; Iterative method
;; ----------------
;;
(define (factorial n)
  (define (fact-iter product counter max-count)
    (if (> counter max-count)
      product
      (fact-iter (* product counter)
                 (+ 1 counter)
                 max-count)))
  (fact-iter 1 1 n))
(define (pascal-item-iterative m n)
  (/ (factorial (- m 1))
     (factorial (- m n))
     (factorial (- n 1))))

(newline)
(display (pascal-item-iterative 4 2))
;Value: 3

