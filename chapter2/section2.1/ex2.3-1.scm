;;; Exercise 2.3 part 1
;;; ===================

(define (peri-rect r)
  (* 2 (+ (length-rect r)
          (width-rect r))))
(define (area-rect r)
  (* (length-rect r)
     (width-rect r)))

;; Representation 1: two line segments

; Abstraction barrier

(define (length-rect r)
  (len-segment (side1-rect r)))
(define (width-rect r)
  (len-segment (side2-rect r)))
(define (print-rect r)
  (print-segment (side1-rect r))
  (print-segment (side2-rect r)))

; Abstraction barrier

(define (make-rect s1 s2)
  (cond ((not (segment-commonend? s1 s2))
         (error "Line segments have no common endpoint"))
        ((not (segment-perpend? s1 s2))
         (error "Line segments not prependicular to each other"))
        (else
          (cons s1 s2))))
(define (side1-rect r)
  (car r))
(define (side2-rect r)
  (cdr r))
  
; Abstraction barrier

(define (len-segment s)
  (dist (start-segment s)
        (end-segment s)))
(define (segment-commonend? s1 s2)
  (or (point-equal? (start-segment s1)
                    (start-segment s2))
      (point-equal? (start-segment s1)
                    (end-segment s2))
      (point-equal? (end-segment s1)
                    (start-segment s2))
      (point-equal? (end-segment s1)
                    (end-segment s2))))
(define (segment-perpend? s1 s2)
  (vector-perpend? (make-vector s1)
            (make-vector s2)))
(define (print-segment s)
  (print-point (start-segment s))
  (print-point (end-segment s)))

; Abstraction barrier

(define (dotproduct-vector v1 v2)
  (+ (* (x-point v1) (x-point v2))
     (* (y-point v1) (y-point v2))))
(define (vector-perpend? v1 v2)
  (= (dotproduct-vector v1 v2) 0))
(define (print-vector v)
  (print-point (x-vector v))
  (print-point (y-vector v)))

; Abstraction barrier

(define (make-vector s)
  (cons (- (x-point (end-segment s))
           (x-point (start-segment s)))
        (- (y-point (end-segment s))
           (y-point (start-segment s)))))
(define (x-vector v)
  (car v))
(define (y-vector v)
  (cdr v))

; Abstraction barrier

(define (make-segment p1 p2)
  (cons p1 p2))
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))

; Abstraction barrier

(define (dist p1 p2)
  (sqrt (+ (square (- (x-point p1)
                      (x-point p2)))
           (square (- (y-point p1)
                      (y-point p2))))))
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
(define p1 (make-point 0 0))
(define p2 (make-point 2 2))
(define p3 (make-point 0 0))
(define p4 (make-point 1 -1))
(print-point p1)
;(0,0)
(define seg1 (make-segment p1 p2))
(define seg2 (make-segment p3 p4))
(print-segment seg1)
;(0,0)
;(2,2)
(define rect (make-rect seg1 seg2))
(print-rect rect)
;(0,0)
;(2,2)
;(0,0)
;(1,-1)
(peri-rect rect)
;Value: 8.485281374238571
(area-rect rect)
;Value: 4.000000000000001

