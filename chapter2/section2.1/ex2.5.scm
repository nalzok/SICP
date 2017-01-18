;;; Exercise 2.5
;;; ============

(define (cons x y)
  (* (expt 2 x)
     (expt 3 y)))

; return a power of b that is bigger than z
(define (bpf b z)
  (define (iter p)
    (if (> p z)
      p
      (iter (square p))))
  (iter b))

(define (car z)
  (inexact->exact (/ (log (gcd z (bpf 2 z)))
                     (log 2))))

(define (cdr z)
  (inexact->exact (/ (log (gcd z (bpf 3 z)))
                     (log 3))))

;(define (car z)
;  (define (iter z x)
;    (if (= 0 (remainder z 2))
;      (iter (/ z 2) (+ 1 x))
;      x))
;  (iter z 0))

;(define (cdr z)
;  (define (iter z y)
;    (if (= 0 (remainder z 3))
;      (iter (/ z 3) (+ 1 y))
;      y))
;  (iter z 0))

(define x 12)
(define y 16)
(define z (cons x y))

(car z)
;Value: 12
(cdr z)
;Value: 16

