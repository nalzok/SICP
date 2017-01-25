;;; Exercise 2.41
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

(define (unique-triples n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k) (list i j k))
                             (enumerate-interval 1 n)))
                      (enumerate-interval 1 n)))
           (enumerate-interval 1 n)))

(define (sum-to-s? triple s)
  (= (+ (car triple)
        (cadr triple)
        (caddr triple))
     s))

(define (triples-sum-to-s n s)
  (filter (lambda (t) (sum-to-s? t s))
          (unique-triples n)))

(triples-sum-to-s 3 5)
;Value 13: ((1 1 3) (1 2 2) (1 3 1) (2 1 2) (2 2 1) (3 1 1))

