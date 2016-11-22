;;; Exercise 1.11
;;; =============
;;; 
;;; The recursive process is relatively straightforward. Look at the function
;;; definition, and try to use it.
;;; 
;;; When designing the iterative one, the idea is to use three integers `a`
;;; , `b` and `c`, initialized to 2, 1 and 0 respectively, and to repeatedly
;;; apply the following simultaneous transformation:
;;; a <- b + c
;;; b <- a
;;; c <- b
;;; until the counter variable hits zero.



(define (f-recursive n)
  (cond ((< n 3) n)
        (else (+ (f-recursive (- n 1))
                 (f-recursive (- n 2))
                 (f-recursive (- n 3))))))

(newline)
(display (f-recursive 10))
;Value: 230

(define (f-iterative n)
  (define (f-iter a b c counter)
    (if (= counter 0)
      c
      (f-iter (+ a b c) a b (- counter 1))))
  (f-iter 2 1 0 n))

(newline)
(display (f-iterative 10))
;Value: 230

