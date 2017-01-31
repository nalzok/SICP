;;; Exercise 2.74-b
;;; ===============

(define (type-tag datum)
  (if (pair? datum)
    (car datum)
    (error "Bad tagged datum -- TYPE-TAG" datum)))
(define (contents datum)
  (if (pair? datum)
    (cdr datum)
    (error "Bad tagged datum -- CONTENTS" datum)))

(define (install-type-A-package)
  (define (get-salary record)
    'foo)
  (put 'get-salary '(A) get-salary))

(define (install-type-B-package)
  (define (get-salary record)
    'bar)
  (put 'get-salary '(B) get-salary))

(define (get-salary record)
  (get 'get-salary (type-tag div-file)) (contents div-file))

;; Similarly, `record` must contain both its type information and content.

