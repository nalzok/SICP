(define (>= x y)
  (or (> x y) (= x y)))

(define (square x)
  (* x x))

(define (sum-of-the-squares-of-the-two-larger-numbers a b c)
  (cond ((and (>= a c) (>= b c))
            (+ (square a) (square b)))
        ((and (>= a b) (>= c b))
            (+ (square a) (square c)))
        ((and (>= b a) (>= c a))
            (+ (square b) (square c)))))

(sum-of-the-squares-of-the-two-larger-numbers 1 1 1)

