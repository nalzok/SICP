;;; Exercise 1.19
;;; =============

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))   ; p'
                   (+ (* q q) (* 2 p q)) ; q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 10)
;Value: 55

;; a' = bq + aq + ap
;;    = (a + b)q + ap
;; b' = bp + aq
;;
;; a'' = (a' + b')q + a'p
;;     = (bq + aq + ap + bp + aq)q + (bq + aq + ap)p
;;     = (a + b)(q^2 + 2pq) + a(p^2 + q^2)
;;     = (a + b)q' + ap'
;; b'' = b'p + a'q
;;     = (bp + aq)p + (bq + aq + ap)q
;;     = b(p^2 + q^2) + a(q^2 + 2pq)
;;     = bp' + aq'
;;
;; You can also consider T and T' as matrices.

