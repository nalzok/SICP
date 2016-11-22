;;; Exercise 1.12 - Extended
;;; ========================
;;;
;;; The instruction only asks me to compute an element of Pascal's triangle
;;; with a given pair of row and column numbers. To challenge myself, I wrote
;;; the following program, which can pretty-print a Pascal's triangle, given
;;; its order.
;;;
;;; For completeness, I wrote two solutions: one is `pascal-recursive`, which
;;; is recursive; the other is `pascal-iterative`, which is iterative. Note
;;; that the sub-definition of `pascal-item` in these two processes are also
;;; recursive and iterative, respectively. To compare their efficicency, you
;;; can increase the order of the Pascal's triangle to be print.



;; Recursive method
;; ----------------
;;
(define (pascal-recursive x)
  (define (pascal-wrapper m step-len)
    (define (pascal-iter m)
      (define (print-row m_)
        (define (print-row-iter n_)
          (cond ((= n_ 0) "Done")
                (else (print-row-iter (- n_ 1))
                      (mid-print (pascal-item m_ n_)))))
        (display "\n") 
        (print-space (* (- x m_) step-len))
        (print-row-iter m_))
      (cond ((= m 0) "Done")
            (else (pascal-iter (- m 1))
                  (print-row m))))
    ; print step-len characters: a centered item and spaces on its both side.
    (define (mid-print item)
      (print-space (floor (- step-len
                             (/ (num-of-digit item) 2))))
      (display item)
      (print-space (ceiling (- step-len
                               (/ (num-of-digit item) 2)))))
    (define (print-space n)
      (cond ((> n 0) (display " ")
                     (print-space (- n 1)))
            (else "Done")))
    (pascal-iter m))
  (define (num-of-digit val)
    (if (and (< val 10) (> val -10))
      1
      (+ (num-of-digit (quotient val 10)) 1)))
  ; recursive
  (define (pascal-item m n)
    (cond ((= n 1) 1)
          ((= n m) 1)
          (else (+ (pascal-item (- m 1) (- n 1))
                   (pascal-item (- m 1) n)))))
  (define max-pascal-item
    (pascal-item x (floor (/ x 2))))
  (pascal-wrapper x (num-of-digit max-pascal-item)))

(newline)
(newline)
(display "pascal-recursive")
(newline)
(pascal-recursive 10)


;; Iterative method
;; ----------------
;;
(define (pascal-iterative x)
  (define (pascal-wrapper x step-len)
    (define (pascal-iter row-counter col-counter max-count)
      (cond ((> row-counter max-count) "Done")
            ((> col-counter row-counter) 
             (display "\n") 
             (print-space (* (- max-count (+ row-counter 1))
                             step-len))
             (pascal-iter (+ row-counter 1) 1 max-count))
            (else (mid-print (pascal-item row-counter
                                          col-counter))
                  (pascal-iter row-counter 
                               (+ col-counter 1)
                               max-count))))
    ; print step-len characters: a centered item and spaces on its both side.
    (define (mid-print item)
      (print-space (floor (- step-len
                             (/ (num-of-digit item) 2))))
      (display item)
      (print-space (ceiling (- step-len
                               (/ (num-of-digit item) 2)))))
    (pascal-iter 0 1 x))
  (define (print-space n)
    (cond ((> n 0) (display " ")
                   (print-space (- n 1)))
          (else "Done")))
  (define (num-of-digit val)
    (if (and (< val 10) (> val -10))
      1
      (+ (num-of-digit (quotient val 10)) 1)))
  ; iterative
  (define (factorial n)
    (define (fact-iter product counter max-count)
      (if (> counter max-count)
        product
        (fact-iter (* product counter)
                   (+ 1 counter)
                   max-count)))
    (fact-iter 1 1 n))
  ; iterative
  (define (pascal-item m n)
    (/ (factorial (- m 1))
       (factorial (- m n))
       (factorial (- n 1))))
  (define max-pascal-item
    (pascal-item x (floor (/ x 2))))
  (pascal-wrapper x (num-of-digit max-pascal-item)))

(newline)
(newline)
(display "pascal-iterative")
(newline)
(pascal-iterative 10)

