;;; Exercise 1.26
;;; =============
;;;
;;; In order to take advantage of applicative-order evaluation, one should
;;; write the same expression twice only when they have to. Instead,
;;; define "helper procedures", such as `square` in this case, to avoid
;;; redundant calculation. You should really be careful, because theta
;;; of n is far worse than theta of log(n).
;;; 
;;; For those who are curious about the use of "they":
;;; https://en.wikipedia.org/wiki/Singular_they
;;;
;;; 
;;;
;;; (define (expmod base exp m)
;;; (cond ((= exp 0) 1)
;;;       ((even? exp)
;;;        (remainder (* (expmod base (/ exp 2) m)
;;;                      (expmod base (/ exp 2) m))
;;;                   m))
;;;       (else
;;;         (remainder (* base (expmod base (- exp 1) m))
;;;                    m))))
;;;
;;; The difference between
;;;     (* (expmod base (/ exp 2) m) (expmod base (/ exp 2) m))
;;; and
;;;     (square (expmod base (/ exp 2) m))
;;; is that `(expmod base (/ exp 2) m)` is calculated twice in the former
;;; expression, but only once in the later one.
;;;
;;; Observe that in Louis Reasoner's program, the procedure `expmod` calls
;;; itself twice, which would results in four consequent calls to `expmod`
;;; , which would make eight further calls... As a result, there would be
;;; a total of 2^(log_2(n)), i.e. n calls, making `expmod` a theta-of-n
;;; process.

