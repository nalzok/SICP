;;; Exercise 1.19
;;; =============
;;;
;;; This exercise provides a general technique which can reduce the order of
;;; growth of a process, which applies a transformation over and over again
;;; , from theta of n to theta of log(n). However, you must find an approach
;;; to "multiply" two such transformations (and their products) first. The
;;; transformation T' is said to be the product of two Ts, if applying T' is
;;; functionally identical to applying T twice, but one T' is hopefully more 
;;; efficient than two successive Ts.
;;; What you are asked to do in this exercise is essentially to "multiply"
;;; two transformations together.
;;;
;;; a' = bq + aq + ap
;;;    = (a + b)q + ap
;;; b' = bp + aq
;;;
;;; a'' = (a' + b')q + a'p
;;;     = (bq + aq + ap + bp + aq)q + (bq + aq + ap)p
;;;     = (a + b)(q^2 + 2pq) + a(p^2 + q^2)
;;;     = (a + b)q' + ap'
;;; b'' = b'p + a'q
;;;     = (bp + aq)p + (bq + aq + ap)q
;;;     = b(p^2 + q^2) + a(q^2 + 2pq)
;;;     = bp' + aq'



(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q)) ; p'
                   (+ (* q q) (* 2 p q)) ; q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(newline)
(display (fib 10))
;Value: 55

