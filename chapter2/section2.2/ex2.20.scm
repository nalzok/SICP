;;; Exercise 2.20
;;; =============

(define (same-parity a . items)
  (define (even l)
    (if (null? l)
      '()
      (let ((this (car l))
            (rest (cdr l)))
        (if (even? this)
          (cons this (even rest))
          (even rest)))))
  (define (odd l)
    (if (null? l)
      '()
      (let ((this (car l))
            (rest (cdr l)))
        (if (odd? this)
          (cons this (odd rest))
          (odd rest)))))
  (if (even? a)
    (cons a (even items))
    (cons a (odd items))))

(same-parity 1 2 3 4 5 6 7)
;Value 13: (1 3 5 7)
(same-parity 2 3 4 5 6 7)
;Value 14: (2 4 6)

