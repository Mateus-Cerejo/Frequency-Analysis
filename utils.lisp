(defun print-frequency-table()
  "Prints the frequency table in the format: 'key: value'"
  (maphash (lambda (key value)
	     (format t "~a: ~a~%" key value))
	   frequency-table))

(defun get-percentage(total)
    "Modifies the frequency table so that the values are the percentage of each key.
     Total should be the sum of the occurrences of all keys in the frequency table."
  (assert (> total 0) (total) "Total must be greater than zero.")
  (maphash (lambda (key value)
	     (setf (gethash key frequency-table) (* 100 (/ value total 1.0))))
	   frequency-table))
