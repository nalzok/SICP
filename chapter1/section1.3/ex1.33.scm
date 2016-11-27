;;; Exercise 1.33
;;; =============
;;;
;;; `Filtered-accumulate` is an even higher-level of abstraction. We added
;;; a new parameter (this time, however, no "magic stuff" is replaced) to
;;; make the procedure more general, which bring it to the higher level.



;; Recursive version
;;
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

;; Iterative version
;;
(define (filtered-accumulate predicate combiner null-value term a next b)
  (define (iter a result)
    (cond ((> a b) result)
          ((predicate a) (iter (next a) (combiner result (term a))))
          (else (iter (next a) result))))
  (iter a null-value))


;; sum-of-square-of-prime-between
;;
(define (prime? n)
  (fast-prime? n 1024))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (sum-of-square-of-prime-between a b)
  (define (inc i) (+ i 1))
  (filtered-accumulate prime? + 0 square a inc b))

(newline)
(display (sum-of-square-of-prime-between 2 10))
;Value: 87
;(= 2^2 + 3^2 + 5^2 + 7^2)

;; product-of-relatively-prime-less-than
;;
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

(newline)
(display (product-of-relatively-prime-less-than 10))
;Value: 189
;(= 1 * 3 * 7 * 9)

