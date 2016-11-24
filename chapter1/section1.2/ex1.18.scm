;;; Exercise 1.18
;;; =============
;;;
;;; The iterative program and its recursive program isn't closely related
;;; here. You may have noticed that my answer for exercise 1.16 actually
;;; uses an algorithm totally different from the one used by the `fast-expt` 
;;; procedure provided by the textbook: `b` is consistent in the book's
;;; version, but in `ex1.16.scm`, it is doubled when `n` is even. Similarly,
;;; in the procedure below, `a` is doubled when `b` is even.
;;;
;;; However, there do exist uniform manners which can  convert a non-tail
;;; recursive precedure that generates a recursive process to its tail
;;; recursive equivalent that generates an iterative process. One idea is
;;; to use continuation passing style (CPS). You can read more on CPS in 
;;; the following link:
;;; http://cs.stackexchange.com/posts/comments/141204



(define (fast-multiply a b)
  (define (even? n)
    (= (remainder n 2) 0))
  (define (double n)
    (* n 2))
  (define (half n)
    (/ n 2))
  (define (multi-iter a b product)
    (cond ((= b 0) product)
          ((even? b) (multi-iter (double a) (half b) product))
          (else (multi-iter a (- b 1) (+ product a)))))
  (multi-iter a b 0))

(newline)
(display (fast-multiply 6 7)) ; works when `b` is odd
;Value: 42
(newline)
(display (fast-multiply 7 6)) ; works when `b` is even
;Value: 42

