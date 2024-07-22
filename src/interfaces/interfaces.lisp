;;; Interfaces

(defpackage :run
  (:use :cl)
  (:export :main))

(defpackage :load
  (:use :cl)
  (:export :set-map :data))

(defpackage :utils
  (:use :cl)
  (:export :alphabetp :round-to-decimal-numbers :print-table :table-values :get-percentage :get-path-to-files))
