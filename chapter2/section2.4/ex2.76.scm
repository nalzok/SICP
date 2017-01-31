;;; Exercise 2.76
;;; =============

;; N -- No changes to existing code are needed
;; T -- All existing types must be changed
;; O -- All existing operations must be changed
;;
;;                                                      Change
;;                                        New type            New operation
;;              Explicit dispatch            O                       T
;;   Solution   Data-directed style          N                       T
;;              Message-passing style        N                       T
;;
;; The differences between data-directed style and message-passing style are:
;;
;; 1. In ED, operations search for the right type; in DDS, both operation
;;    and type are used as keys in searching a table; in MPS, types search
;;    for the right operation.
;; 2. DDS installs operations by type and maintains a table of operations,
;;    while MPS simply wraps operations in types.
;; 3. DDS supports multi-argument operations, while MPS does not.
;;
;; As the table above suggests, both DDS and MPS are appropriate for a system
;; in which new operations/types must often be added. However, DDS is better,
;; because it provides multi-argument support.

