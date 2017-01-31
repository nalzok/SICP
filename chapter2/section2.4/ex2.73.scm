;;; Exercise 2.73
;;; =============

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp)) (operands exp)
                                           var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;; Q: Explain what was done above. Why can't we assimilate the predicates
;;    `number?` and `same-variable?` into the data-directed dispatch?
;;
;; A: Sum and product are considered as "types" of an expression. `Get` is
;;    is called with the type(operator) and the untyped content(operands)
;;    to fetch the approciate procedure to perform the differentiation.
;;
;;                                      Types
;;
;;                                  sum   |  product
;;              Opera-          ----------+-----------
;;              tions     deriv |   ...   |    ...    
;;
;;
;;    `Number?` and `same-variable?` cannot be assimilated into the data-
;;    directed dispatch because numbers and variables are symbols rather
;;    than lists, and thus don't have type tags.

;; Q: Write the procedures for derivatives of sums and products, and the
;;    auxiliary code required to install them in the table used by the
;;    program above.

(define (install-sum-package)
  ;; internal procedures
  (define (addend s) (car s))
  (define (augend s) (cadr s))
  (define (make-sum a1 a2)
    (list '+ a1 a2))
  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))
  ;; interface to the rest of the system
  (put 'deriv '(+) deriv-sum)
  'done)

(define (install-product-package)
  ;; internal procedures
  (define (multiplier p) (car p))
  (define (multiplicand p) (cadr p))
  (define (make-product m1 m2)
    (list '* m1 m2))
  (define (deriv-product exp var)
    (make-sum
      (make-product (multiplier exp)
                    (deriv (multiplicand exp) var))
      (make-product (deriv (multiplier exp) var)
                    (multiplicand exp))))
  ;; interface to the rest of the system
  (put 'deriv '(*) deriv-product)
  'done)

;;    Alternatively, we can combine two packages into one:

(define (install-deriv-package)
  ;; internal procedures
  (define (addend s) (car s))
  (define (augend s) (cadr s))
  (define (make-sum a1 a2)
    (list '* a1 a2))
  (define (deriv-sum exp)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))

  (define (multiplier-1 p) (car p))
  (define (multiplicand-1 p) (cadr p))
  (define (make-product-1 m1 m2)
    (list '* m1 m2))
  (define (deriv-product exp)
    (make-sum
      (make-product (multiplier exp)
                    (deriv (multiplicand exp) var))
      (make-product (deriv (multiplier exp) var)
                    (multiplicand exp))))

  ;; interface to the rest of the system
  (put 'deriv '(+) deriv-sum)
  (put 'deriv '(*) deriv-product)
  'done)

;; Q: Choose any additional differentiation rule that you like, such as
;;    the one for exponents (exercise 2.56), and install it in this data-
;;    directed system.

(define (install-exponentiation-package)
  ;; internal procedures
  (define (base p) (car p))
  (define (exponent p) (cadr p))
  (define (make-exponentiation b e)
    (list '** b e))
  (define (deriv-exponentiation exp var)
    (let ((b (base exp))
          (e (exponent exp)))
      (make-product
        (make-product
          e
          (make-exponentiation b
                               (- e 1)))
        (deriv b var))))
  ;; interface to the rest of the system
  (put 'deriv '(**) deriv-exponentiation)
  'done)

;; Q: In this simple algebraic manipulator the type of an expression is
;;    the algebraic operator that binds it together. Suppose, however, we
;;    indexed the procedures in the opposite way, so that the dispatch
;;    line in `deriv` looked like
;;    
;;    ((get (operator exp) 'deriv) (operands exp) var)
;;    
;;    What corresponding changes to the derivative system are required?
;;
;; A: Due to this modification, the usages of `put` and `get` are changed:
;;
;;    (put <type> <op> <item>)
;;    (get <type> <op>)
;;
;;    As a result, We'll have to switch the operands of all `put`s and
;;    `get`s. For example:
;;
;;    (put 'deriv '(+) deriv-sum)  ===>  (put '(+) 'deriv deriv-sum)
;;
;;                                 and
;;
;;                    (define (make-product m1 m2)
;;                      ((get 'make-product '*) m1 m2))
;;                                  ||
;;                                  ||
;;                                  \/
;;                    (define (make-product m1 m2)
;;                      ((get '* 'make-product) m1 m2))

