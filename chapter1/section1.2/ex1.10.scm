;;; Exercise 1.10 
;;; =============
;;;
;;; Just for fun, I've also included `(i n)`, which is defined to be `(A 3 n)`.
;;;
;;; If you know the concise mathematical definition of `(A x y)`, it would be
;;; easy to tell what `(A x+1 y)` means. Also, as the "Note that" lines below
;;; indicates, generally speaking, `(A x+1 y) = (A x (A x y-1))`.



(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; Typing these expressions to an interpretor would do the job.
(newline)
(display (A 1 10))
;Value: 1024
(newline)
(display (A 2 4))
;Value: 65536
(newline)
(display (A 3 3))
;Value: 65536


; If n = 0, (f n) = (g n) = (h n) = 0, assuming n != 0

(define (f n) (A 0 n))
; (f n) -> 2*n

(define (g n) (A 1 n))
; (g n) -> (A 1 n) -> (A 0 (A 1 (- 1 n)))
; -> (A 0 (A 0 ... (A 0 (A 1 1))))
; -> (A 0 (A 0 ... (A 0 2))) -> 2^n
;
; Note that (g n) = (f (g n-1)) = 2*2^(n-1) = 2^n

(define (h n) (A 2 n))
; (h n) -> (A 2 n) -> (A 1 (A 2 (- 1 n)))
; -> (A 1 (A 1 ... (A 1 (A 2 1))))
; -> (A 1 (A 1 ... (A 1 2))) -> 
; -> (A 1 (A 1 ... 2^2)))
; -> 2^(2^(2^(...2^2)))
;     \     n     /
;
; Note that (h n) = (g (h n-1)) = 2^(h n-1)
;
; e.g. (h 3) = (A 1 (A 1 2)) = 2^(2^2) = 16
;      (h 4) = 2^(2^(2^2)) = 65536

(define (i n) (A 3 n))
; (i n) -> (A 3 n) -> (A 2 (A 3 (- 1 n)))
; -> (A 2 (A 2 ... (A 2 (A 3 1))))
; -> (A 2 (A 2 ... (A 2 2)))
; -> (A 2 (A 2 ... 2^2)))
; -> 2^(2^(2^(...2^2)))
;     \  (i n-1)  /
;
; Note that (i n) = (g (i n-1))
;
; e.g. (i 3) = (A 2 (A 2 2)) = (A 2 2^2) = (A 2 4) = 65536

