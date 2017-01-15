;;; Exercise 1.12 extended: Pretty-print a Pascal's trangle
;;; ========================

;; Recursive

(define (pascal x)
  (define (pascal-wrapper m step-len)
    (define (pascal-iter m)
      (define (print-row m_)
        (define (print-row-iter n_)
          (cond ((= n_ 0) "done")
                (else (print-row-iter (- n_ 1))
                      (mid-print (pascal-item m_ n_)))))
        (display "\n") 
        (print-space (* (- x m_) step-len))
        (print-row-iter m_))
      (cond ((= m 0) "done")
            (else (pascal-iter (- m 1))
                  (print-row m))))
    ; print `step-len` characters: one number surrounded by spaces
    (define (mid-print item)
      (print-space (floor (- step-len
                             (/ (num-of-digit item) 2))))
      (display item)
      (print-space (ceiling (- step-len
                               (/ (num-of-digit item) 2)))))
    (define (print-space n)
      (cond ((> n 0) (display " ")
                     (print-space (- n 1)))
            (else "done")))
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

(pascal 10)
;                             1   
;                          1     1   
;                       1     2     1   
;                    1     3     3     1   
;                 1     4     6     4     1   
;              1     5     10    10    5     1   
;           1     6     15    20    15    6     1   
;        1     7     21    35    35    21    7     1   
;     1     8     28    56    70    56    28    8     1   
;  1     9     36    84   126   126    84    36    9     1   

;; Iterative

(define (pascal x)
  (define (pascal-wrapper x step-len)
    (define (pascal-iter row-counter col-counter max-count)
      (cond ((> row-counter max-count) "done")
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
    ; print `step-len` characters: one number surrounded by spaces
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
          (else "done")))
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

(pascal 10)
;                             1   
;                          1     1   
;                       1     2     1   
;                    1     3     3     1   
;                 1     4     6     4     1   
;              1     5     10    10    5     1   
;           1     6     15    20    15    6     1   
;        1     7     21    35    35    21    7     1   
;     1     8     28    56    70    56    28    8     1   
;  1     9     36    84   126   126    84    36    9     1   

