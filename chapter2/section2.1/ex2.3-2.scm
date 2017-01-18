;;; Exercise 2.3 part 2
;;; ===================

(define (peri-rect r)
  (* 2 (+ (length-rect r)
          (width-rect r))))
(define (area-rect r)
  (* (length-rect r)
     (width-rect r)))

;; Representation 2: two vectors and one center point

; Abstraction barrier

(define (length-rect r)
  (len-vector (side1-rect r)))
(define (width-rect r)
  (len-vector (side2-rect r)))
(define (side1-rect r)
  (add-vector (v1-rect r)
              (v2-rect r)))
(define (side2-rect r)
  (sub-vector (v1-rect r)
              (v2-rect r)))
(define (print-rect r)
  (print-point (p-rect r))
  (print-vector (side1-rect r))
  (print-vector (side2-rect r)))

; Abstraction barrier

(define (make-rect p v1 v2)
  (cond ((not (= (len-vector v1)
                 (len-vector v2)))
         (error "Vectors have different length"))
        ((vector-equal? v1 v2)
         (error "Vectors are identical"))
        (else
          (cons p (cons v1 v2)))))
(define (v1-rect r)
  (car (cdr r)))
(define (v2-rect r)
  (cdr (cdr r)))
(define (p-rect r)
  (car r))
  
; Abstraction barrier

(define (vector-equal? v1 v2)
  (and (= (x-vector v1)
          (x-vector v2))
       (= (y-vector v1)
          (y-vector v2))))
(define (add-vector v1 v2)
  (make-vector (+ (x-vector v1)
                  (x-vector v2))
               (+ (y-vector v1)
                  (y-vector v2))))
(define (sub-vector v1 v2)
  (make-vector (- (x-vector v1)
                  (x-vector v2))
               (- (y-vector v1)
                  (y-vector v2))))
(define (len-vector v)
  (sqrt (+ (square (x-vector v))
           (square (y-vector v)))))
(define (dotproduct-vector v1 v2)
  (+ (* (x-point v1) (x-point v2))
     (* (y-point v1) (y-point v2))))
(define (vector-perpend? v1 v2)
  (= (dotproduct-vector v1 v2) 0))
(define (print-vector v)
  (newline)
  (display "[")
  (display (x-vector v))
  (display ",")
  (display (y-vector v))
  (display "]"))

; Abstraction barrier

(define (make-vector x y)
  (cons x y))
(define (x-vector v)
  (car v))
(define (y-vector v)
  (cdr v))

; Abstraction barrier

(define (point-equal? p1 p2)
  (and (= (x-point p1) (x-point p2))
       (= (y-point p1) (y-point p2))))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; Abstraction barrier

(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

; Testing
(define p (make-point 0 0))
(print-point p)
;(0,0)
(define v1 (make-vector 1 1))
(define v2 (make-vector -1 1))
(print-vector v1)
;[1,1]
(define rect (make-rect p v1 v2))
(print-rect rect)
;(0,0)
;[0,2]
;[2,0]
(peri-rect rect)
;Value: 8
(area-rect rect)
;Value: 4

