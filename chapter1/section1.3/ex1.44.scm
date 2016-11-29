;;; Exercise 1.44
;;; =============
;;;
;;; Define the `smooth` procedure and repeat it using `repeated`.



(define dx 0.00001)
(define (smooth f)
  (lambda (x) (/ (+ (f x)
                    (f (- x dx))
                    (f (+ x dx)))
                 3.0)))

(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (if (= n 1)
    f
    (compose f (repeated f (- n 1)))))

(newline)
(display (((repeated smooth 5) tan) 1))
;Value: 1.5574077264332118

