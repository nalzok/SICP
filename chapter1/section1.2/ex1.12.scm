;;; Exercise 1.12
;;; =============

;; Recursive

(define (pascal-item m n)
  (cond ((= n 1) 1)
        ((= n m) 1)
        (else (+ (pascal-item (- m 1) (- n 1))
                 (pascal-item (- m 1) n)))))

(pascal-item 4 2)
;Value: 3

;; Iterative

(define (pascal-item m n)
  (define (factorial n)
    (define (fact-iter product counter max-count)
      (if (> counter max-count)
        product
        (fact-iter (* product counter)
                   (+ 1 counter)
                   max-count)))
    (fact-iter 1 1 n))
  ;; binomial theorem
  (/ (factorial (- m 1))
     (factorial (- m n))
     (factorial (- n 1))))

(pascal-item 4 2)
;Value: 3

