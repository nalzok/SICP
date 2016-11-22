(define (expmod base expo m)
  (define (square n)
    (* n n))
  (define (even? n)
    (= (remainder n 2) 0))
  (define (expmod base expo m result)
    (cond ((= expo 0) result)
          ((even? expo)
           (expmod base
                   (/ expo 2)
                   m
                   (remainder (square result) m)))
          (else
           (expmod base
                   (- expo 1)
                   m
                   (remainder (* base result) m)))))
  (expmod base expo m 1))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(newline)
(display (fast-prime? 10152150117 10))
;Value: #f ; <- not guaranteed to be correct
