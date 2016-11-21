;;; Exercise 1.9
;;; ============
;;;
;;; Consider of the "shapes" of the two processes, we can see that the upper
;;; one has a shape of expansion followed by contraction, indicating a chain
;;; of deferred operations, which makes it a recursive process, while the
;;; lower one does not grow and shrink, and is thus an iterative process.
;;;
;;; Program variables of a iterative process provide a complete description
;;; of the state of the process at any point, while recursive processes require
;;; some additional ''hidden'' information not contained in the variables. 
;;; Typically, a iterative process would have a variable storing the final
;;; result. For example, acc(abbr. accumulator) and b in this case.



(define (+ a b)
  (if (= a 0)
    b
    (inc (+ (dec a) b))))
; (+ 4 5)
; (inc (+ 3 5))
; (inc (inc (+ 2 5)))
; (inc (inc (inc (+ 1 5))))
; (inc (inc (inc (inc (+ 0 5)))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9

(define (+ a b)
  (if (= a 0)
    b
    (+ (dec a) (inc b))))
; (+ 4 5)
; (+ 3 6)
; (+ 2 7)
; (+ 1 8)
; (+ 0 9)
; 9

