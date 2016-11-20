(define (count-change-iterative amount)
  (define (count-half-dollar half-dollar)
    (define (count-quarter quarter)
      (define (count-dime dime)
        (define (count-nickeli nickeli)
            (define (print-change)
              (display "\n")
              (mid-print-item half-dollar)
              (mid-print-item quarter)
              (mid-print-item dime)
              (mid-print-item nickeli)
              (mid-print-item (- amount
                                 (* half-dollar 50)
                                 (* quarter 25)
                                 (* dime 10)
                                 (* nickeli 5))))
            (define (mid-print-item item)
              (print-space (ceiling (/ (- (num-of-digit amount)
                                          (num-of-digit item)) 2)))
              (display item)
              (print-space (floor (+ (/ (- (num-of-digit amount)
                                           (num-of-digit item)) 2) 1))))
            (define (print-space num-of-space)
              (cond ((= num-of-space 0) "Done")
                    (else
                      (display " ")
                      (print-space (- num-of-space 1)))))
            (define (num-of-digit val)
              (if (and (< val 10) (> val -10))
                1
                (+ (num-of-digit (quotient val 10)) 1)))
          ;; count-nickeli
          (cond ((> (+ (* half-dollar 50)
                       (* quarter 25)
                       (* dime 10)
                       (* nickeli 5)) amount)
                 0)
                (else
                  (print-change)
                  (+ (count-nickeli (+ nickeli 1)) 1))))
        ;; count-dime
        (cond ((> (+ (* half-dollar 50)
                     (* quarter 25)
                     (* dime 10)) amount)
               0)
              (else
                (+ (count-dime (+ dime 1)) (count-nickeli 0)))))
      ;; count-quarter
      (cond ((> (+ (* half-dollar 50)
                   (* quarter 25)) amount)
             0)
            (else
              (+ (count-quarter (+ quarter 1)) (count-dime 0)))))
    ;; count-half-dollar
    (cond ((> (+ (* half-dollar 50)) amount)
           0)
          (else
            (+ (count-half-dollar (+ half-dollar 1)) (count-quarter 0)))))
  (count-half-dollar 0))

(display (count-change-iterative 100))
