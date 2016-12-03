;;; Exercise 1.3
;;; ============
;;;

(define (larger x y)
  (if (> x y) 
    x
    y))

(define (square x)
  (* x x))

(define (sum-of-square x y)
  (+ (square x) (square y)))

(define (sum-of-the-squares-of-the-two-larger-numbers a b c)
  ; If `a` > `b`, `a` can't be the smallest number, so `a` must be one of
  ; the two larger numbers. Otherwise, `b` can't be the smallest number, so
  ; `b` must be one of the two larger numbers.
  (cond ((> a b)
          (sum-of-square a (larger b c)))
        (else
          (sum-of-square b (larger a c)))))

(sum-of-the-squares-of-the-two-larger-numbers 1 2 3)
;Value: 13

