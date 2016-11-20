;;; Exercise 1.2
;;; ============
;;;
;;; Translate the expression into prefix form. 
;;; Used pretty-printing for readability.

(/ (+ 5 4 
      (- 2 
         (- 3 
            (+ 6 (/ 4 5))
         )
      )
   )
   (* 3 (- 6 2) (- 2 7))
)

