;;; Exercise 2.58-b
;;; ===============

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        (else
          (error "unknown expression type -- DERIV" exp))))

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (sum? x)
  (and (pair? x) (memq '+ x)))
(define (addend s)
  (let ((add (mem-utl '+ s)))
   (if (null? (cdr add))
     (car add)
     add)))
(define (augend s)
  (let ((aug (cdr (memq '+ s))))
   (if (null? (cdr aug))
     (car aug)
     aug)))
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        ((or (sum? a1) (sum? a2))
         (append (if (pair? a1) a1 (list a1))
                 (list '+)
                 (if (pair? a2) a2 (list a2))))
        (else (list a1 '+ a2))))

(define (product? x)
  (and (pair? x)
       (not (sum? x))
       (memq '* x)))
(define (multiplier p)
  (car p))
(define (multiplicand p)
  (let ((mul (cddr p)))
   (if (null? (cdr mul))
     (car mul)
     mul)))
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2))
         (* m1 m2))
        ((or (product? m1) (product? m2))
         (append (if (pair? a1) a1 (list a1))
                 (list '*)
                 (if (pair? a2) a2 (list a2))))
        (else (list m1 '* m2))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))
(define (mem-utl item x)
  (if (or (null? x)
          (eq? item (car x)))
    '()
    (cons (car x)
          (mem-utl item (cdr x)))))

(deriv '(x + 3 * (x + y + 2)) 'x)
;Value: 4
(deriv '(x + 3 * (x + y + 2)) 'y)
;Value: 3

