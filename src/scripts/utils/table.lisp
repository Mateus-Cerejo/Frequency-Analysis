;;;; Table Utility Functions

;;;; This file contains utility functions for operations on hash tables used throughout the project. It includes:
;;;;
;;;;     - Table Functions:
;;;;         - `print-table`: Prints the contents of a hash table in the format 'key: value'.
;;;;         - `table-values`: Returns a list of all the values in a hash table.
;;;;         - `get-percentage`: Modifies the values of a hash table to represent the percentage of each key's occurrence.
;;;;
;;;; Usage:
;;;;     The table utility functions can be used to manage and manipulate hash tables,
;;;;     especially for tasks that involve printing, aggregating values, and calculating percentages.
;;;;
;;;; Note:
;;;;     This file assumes the `utils` package is properly defined and used across the project.

;;;; This file is part of Frequency-Based Cipher Deciphering
;;;;
;;;; Copyright (c) 2024 ludef4r and Mateus-Cerejo
;;;; Licensed under the MIT License. See LICENSE file for details.

;;; Package

(in-package :utils)

;;; Table functions

(defun print-table(table)
  "Prints table in the format: 'key: value'"
  (maphash (lambda (key value)
	     (format t "~a: ~a~%" key value))
	   table))

(defun table-values(table)
  "Returns a list with all the values of table"
  (let ((result '()))
    (maphash (lambda (_ value) (declare (ignore _)) (push value result)) table)
    (nreverse result)))

(defun get-percentage(table)
    "Modifies the table so that the values are the percentage of each key.
     In table, the values must be the number of occurances of the keys."
  (assert (not (null table)) (table) "Table can't be null.")
  (let ((total (reduce #'+ (table-values table))))
    (maphash (lambda (key value)
	       (setf (gethash key table) (round-to-decimal-places (* 100 (/ value total)) 2)))
	   table)))
