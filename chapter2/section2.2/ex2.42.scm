;;; Exercise 2.42
;;; =============

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

(define empty-board '())

; You don't really need `k`
(define (safe? k positions)
  (define (safe-iter i pos result)
    (if (null? pos)
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

; `new-row` is attached to the beginning of `rest-of-queens`
(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(queens 8)
;Value: <omitted>
(length (queens 8))
;Value: 92

