;;; Exercise 2.43
;;; =============

;; This question is kind of weird. Since T is the only known quantity, the
;; anwer must be "<coefficient> * T" (otherwise, the answer would not be in
;; the same unit as T, for example, in millisecond or in second). However, I
;; don't feel like the answer is in such a form.
;;
;; Let T(k) be the time required for my code to solve k-queens puzzle;
;;     T'(k) be the time required for Louis's code to solve k-queens puzzle;
;;     Q(k) be the number of solutions to k-queens puzzle.
;;
;;                          T(k) = T(k-1) + k * Q(k-1)
;;                      T'(k) = k * T'(k-1) + k * Q(k-1)
;;
;; I cannot deduce the order of growth of number of steps of the two versions
;; of `queens` from the two equations above, so I carried out an experiment to
;; answer this question.

(define (enumerate-interval low high)
  (if (> low high)
    '()
    (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define empty-board '())

(define (safe? k positions)
  (define (safe-iter i pos result)
    (if (= i k)
      result
      (let ((last (car positions))
            (this (car pos))
            (rest (cdr pos)))
        (safe-iter (+ i 1)
                   rest
                   (or (= last (+ this i))
                       (= last (- this i))
                       (= last this)
                       result)))))
  (not (safe-iter 1 (cdr positions) #f)))

(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(define (timed-queens n)
  (newline)
  (display n)
  (start-queens n (runtime)))
(define (start-queens n start-time)
  (if (queens n)
    (report-queens (- (runtime) start-time))))
(define (report-queens elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        ; `queen-cols` is re-calculated for every element
        ; in `(enumerate-interval 1 board-size)`
        (flatmap
          (lambda (new-row)
            (map (lambda (rest-of-queens)
                   (adjoin-position new-row k rest-of-queens))
                 (queen-cols (- k 1))))
          (enumerate-interval 1 board-size)))))
  (queen-cols board-size))

;; Uncomment the following expressions if you want to run these tests on you
;; own computer. However, please note that this would be very time-consuming.

;(timed-queens 5)
;5 *** .03
;(timed-queens 6)
;6 *** .5299999999999999
;(timed-queens 7)
;7 *** 9.27
;(timed-queens 8)
;8 *** 200.79
;(timed-queens 9)
;9 *** 4909.44
;(timed-queens 10)
;10 *** 134657.44
;(timed-queens 11)
;11
;Aborting!: maximum recursion depth exceeded

(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

;(timed-queens 5)
;5 *** 0.
;(timed-queens 6)
;6 *** 0.
;(timed-queens 7)
;7 *** .04000000000814907
;(timed-queens 8)
;8 *** .17999999999301508
;(timed-queens 9)
;9 *** .9100000000034925
;(timed-queens 10)
;10 *** 4.869999999995343
;(timed-queens 11)
;11
;Aborting!: maximum recursion depth exceeded

;; Time data is in second.(which means this experiment took me 38.8 hours)
;;
;;  k   T'(k)/T(k)
;;  5      NaN
;;  6      NaN
;;  7      23.2
;;  8      1115.5
;;  9      5395.0
;;  10     27650.4

