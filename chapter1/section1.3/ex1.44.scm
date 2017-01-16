;;; Exercise 1.44
;;; =============

(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (if (= n 1)
    f
    (compose f (repeated f (- n 1)))))

(define dx 0.00001)
(define (smooth f)
  (lambda (x) (/ (+ (f x)
                    (f (- x dx))
                    (f (+ x dx)))
                 3.0)))

(define (nth-smooth f n)
  ((repeated smooth n) f))

((nth-smooth tan 5) 1)
;Value: 1.5574077264332118

