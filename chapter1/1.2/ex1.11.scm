(define (f-recursive n)
  (cond ((< n 3) n)
        (else (+ (f-recursive (- n 1))
                 (f-recursive (- n 2))
                 (f-recursive (- n 3))))))

(define (f-iterative n)
  (define (f-iter a b c d)
    (if (= d 0)
      c
      (f-iter (+ a b c) a b (- d 1))))
  (f-iter 2 1 0 n))

