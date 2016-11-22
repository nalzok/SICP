;;; Iterative `expmod` implementation
;;; ==========================================
;;;
(define (expmod base expo m)
  (define (square n)
    (* n n))
  (define (even? n)
    (= (remainder n 2) 0))
  (define (expmod-iter base expo m result)
    (cond ((= expo 0) result)
          ((even? expo)
           (expmod-iter base
                        (/ expo 2)
                        m
                        (remainder (square result) m)))
          (else
           (expmod-iter base
                        (- expo 1)
                        m
                        (remainder (* base result) m)))))
  (expmod-iter base expo m 1))

; To understand it better, you can rewrite it in another form. What takes 
; `expo` in the code above to zero also takes `counter` in the code below
; to `expo`.
;
#|
(define (expmod base expo m)
  (define (square n)
    (* n n))
  (define (even? n)
    (= (remainder n 2) 0))
  (define (expmod-iter base expo m result counter)
    (cond ((= counter expo) result)
          ((even? expo)
           (expmod-iter base
                        expo
                        m
                        (remainder (square result) m)
                        (* counter 2)))
          (else
           (expmod-iter base
                        expo
                        m
                        (remainder (* base result) m)
                        (+ counter 1)))))
  (expmod-iter base expo m 1 0))
|#

(newline)
(display (expmod 3 5 8))
;Value: 3

