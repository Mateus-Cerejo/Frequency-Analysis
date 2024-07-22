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
