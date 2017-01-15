;;; Exercise 1.11
;;; =============

;; Recursive

(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (f (- n 2))
                 (f (- n 3))))))

(f 10)
;Value: 230

;; Iterative

(define (f n)
  (define (f-iter a b c counter)
    (if (= counter 0)
      c
      (f-iter (+ a b c) a b (- counter 1))))
  (f-iter 2 1 0 n))

(f 10)
;Value: 230

