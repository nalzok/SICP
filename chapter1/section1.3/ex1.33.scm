;;; Exercise 1.33
;;; =============

;; Recursive

(define (filtered-accumulate predicate combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((predicate a) (combiner (term a) (filtered-accumulate
                                           predicate
                                           combiner
                                           null-value
                                           term
                                           (next a)
                                           next
                                           b)))
        (else (filtered-accumulate
               predicate
               combiner
               null-value
               term
               (next a)
               next
               b))))

;; Iterative

(define (filtered-accumulate predicate combiner null-value term a next b)
  (define (iter a result)
    (cond ((> a b) result)
          ((predicate a)
           (iter (next a) (combiner (term a) result)))
          (else
            (iter (next a) result))))
  (iter a null-value))

;; `sum-of-square-of-prime-between`

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))
(define (prime? n)
  (fast-prime? n 1024))

(define (sum-of-square-of-prime-between a b)
  (define (inc i) (+ i 1))
  (filtered-accumulate prime? + 0 square a inc b))

(sum-of-square-of-prime-between 2 10)
;Value: 87

;; `product-of-relatively-prime-less-than`

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))
(define (relatively-prime? i n)
  (= (gcd i n) 1))

(define (product-of-relatively-prime-less-than n)
  (define (relatively-prime-to-n? i)
    (relatively-prime? i n))
  (define (identity i) i)
  (define (inc i) (+ i 1))
  (filtered-accumulate relatively-prime-to-n? * 1 identity 1 inc n))

(product-of-relatively-prime-less-than 10)
;Value: 189

