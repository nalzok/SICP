(define (fast-expt b n)
  (define (even? n)
    (= (remainder n 2) 0))
  (define (square num)
    (* num num))
  (define (expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (expt-iter (square b) (/ n 2) a))
          (else (expt-iter b (- n 1) (* a b)))))
  (expt-iter b n 1))

(display (fast-expt 2 10))

