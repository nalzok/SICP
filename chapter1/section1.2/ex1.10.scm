;;; Exercise 1.10 
;;; =============

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
;Value: 1024
(A 2 4)
;Value: 65536
(A 3 3)
;Value: 65536

;; Note that n has "positive integer values". If n = 0, then (f n) = (g n)
;; = (h n) = 0.

(define (f n) (A 0 n))
;; (f n) -> 2*n
;;
;; e.g.
(f 4)
;Value: 8

(define (g n) (A 1 n))
;; (g n) -> (A 1 n) -> (A 0 (A 1 (- 1 n)))
;; -> (A 0 (A 0 ... (A 0 (A 1 1))))
;; -> (A 0 (A 0 ... (A 0 2))) -> 2^n
;;
;; From another point of view, (g n) = (f (g n-1)) = 2*2^(n-1) = 2^n
;;
;; e.g.
(g 4)
;Value: 16

(define (h n) (A 2 n))
;; (h n) -> (A 2 n) -> (A 1 (A 2 (- 1 n)))
;; -> (A 1 (A 1 ... (A 1 (A 2 1))))
;; -> (A 1 (A 1 ... (A 1 2))) -> 
;; -> (A 1 (A 1 ... 2^2)))
;; -> 2^(2^(2^(...2^2)))
;;     \     n     /
;;
;; From another point of view, (h n) = (g (h n-1)) = 2^(h n-1)
;;
;; e.g. (h 3) = (A 1 (A 1 2)) = 2^(2^2) = 16
;;      (h 4) = 2^(2^(2^2)) = 65536
(h 3)
;Value: 16
(h 4)
;Value: 65536

(define (k n) (* 5 n n))
;; (k n) -> (* 5 n n) -> 5*n^2
;;
;; e.g.
(k 4)
;Value: 80

(define (i n) (A 3 n))
;; (i n) -> (A 3 n) -> (A 2 (A 3 (- 1 n)))
;; -> (A 2 (A 2 ... (A 2 (A 3 1))))
;; -> (A 2 (A 2 ... (A 2 2)))
;; -> (A 2 (A 2 ... 2^2)))
;; -> 2^(2^(2^(...2^2)))
;;     \  (i n-1)  /
;;
;; From another point of view, (i n) = (g (i n-1))
;;
;; e.g. (i 3) = (A 2 (A 2 2)) = (A 2 2^2) = (A 2 4) = 65536
(i 3)
;Value: 65536

;; Generally speaking, `(A x+1 y) = (A x (A x y-1))`.

