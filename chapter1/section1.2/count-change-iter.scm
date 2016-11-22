;;; Iterative "counting change" implementation
;;; ==========================================
;;;
(define (count-change amount)
  ; Penny can be determined given amount, half-dollar, quarter, dime and
  ; nickeli, so it's unnecessary to include it in the formal parameters.
  (define (count-iter half-dollar quarter dime nickeli acc)
    (cond ((> (* half-dollar 50) amount)
           acc)
          ((> (+ (* half-dollar 50)
                 (* quarter 25)) amount)
           (count-iter (+ half-dollar 1) 0 0 0 acc))
          ((> (+ (* half-dollar 50)
                 (* quarter 25)
                 (* dime 10)) amount)
           (count-iter half-dollar (+ quarter 1) 0 0 acc))
          ((> (+ (* half-dollar 50)
                 (* quarter 25)
                 (* dime 10)
                 (* nickeli 5)) amount)
           (count-iter half-dollar quarter (+ dime 1) 0 acc))
          (else (count-iter half-dollar
                            quarter
                            dime
                            (+ nickeli 1)
                            (+ acc 1)))))
  (count-iter 0 0 0 0 0))

(newline)
(display (count-change 100))
;Value: 292

