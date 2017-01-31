;;; Exercise 2.74-a
;;; ===============

(define (type-tag datum)
  (if (pair? datum)
    (car datum)
    (error "Bad tagged datum -- TYPE-TAG" datum)))
(define (contents datum)
  (if (pair? datum)
    (cdr datum)
    (error "Bad tagged datum -- CONTENTS" datum)))

(define (install-division-A-package)
  ;; internal procedures
  (define (get-record name file)
    'foo)
  ;; interface to the rest of the system
  (put 'get-record '(A) get-record))

(define (install-division-B-package)
  (define (get-record name file)
    'bar)
  (put 'get-record '(B) get-record))

(define (get-record name div-file)
  (get 'get-record (type-tag div-file)) name (contents div-file))

;; Each file from an individual division must contain two parts: its type (i.e.
;; the division from which it comes), and the content (i.e. the data object to
;; be looked up in).

