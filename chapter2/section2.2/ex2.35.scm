;;; Exercise 2.35
;;; =============

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1) (enumerate-tree t))))
  
(count-leaves 42)
;Value: 1
(define x (cons (list 1 2) (list 3 4)))
(count-leaves x)
;Value: 4
(count-leaves (list x x))
;Value: 8

