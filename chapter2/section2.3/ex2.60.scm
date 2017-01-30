;;; Exercise 2.60
;;; =============

;; Theta of n
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? (car set x)) #t)
        (else (element-of-set? x (cdr set)))))

;; Theta of 1
(define (adjoin-set x set)
  (cons x set))

;; Theta of n
(define (union-set set1 set2)
  (append set1 set2))

;; Theta of n^2
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;; This representation is prefered by applications which requires a lot of
;; construction-like operations(e.g. `adjoin-set`), but only a few lookup-like
;; operations(e.g. `element-of-set?`).

