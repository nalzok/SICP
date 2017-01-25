;;; Exercise 2.37
;;; =============

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate op init (map car seqs))
          (accumulate-n op init (map cdr seqs)))))

(define v (list 1 2 3 4))
(define w (list 5 6 7 8))
(define m (list (list 1 2 3 4)
                (list 5 6 7 8)
                (list 9 10 11 12)))
(define n (list (list 1 2)
                (list 3 4)
                (list 5 6)
                (list 7 8)))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))
(dot-product v w)
;Value: 70

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product v row)) m))
(matrix-*-vector m v)
;Value 13: (30 70 110)

(define (transpose mat)
  (accumulate-n cons '() mat))
(transpose m)
;Value 14: ((1 5 9) (2 6 10) (3 7 11) (4 8 12))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
   (map (lambda (row) (matrix-*-vector cols row)) m)))
(matrix-*-matrix m n)
;Value 15: ((50 60) (114 140) (178 220))

