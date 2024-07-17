;; Path

(defun get-path(file)
  "Returns the path to the file"
  (concatenate 'string "~/Projects/SI-Project/" file))

;; Hash Table

(defun print-table(table)
  "Prints table in the format: 'key: value'"
  (maphash (lambda (key value)
	     (format t "~a: ~a~%" key value))
	   table))

(defun table-values(table)
  "Returns a list with all the values of table"
  (let ((result '()))
    (maphash (lambda (_ value) (push value result)) table)
    (nreverse result)))

(defun get-percentage(table)
    "Modifies the table so that the values are the percentage of each key.
     In table, the values must be the number of occurances of the keys."
  (assert (not (null table)) (table) "Table can't be null.")
  (let ((total (reduce #'+ (table-values table))))
    (maphash (lambda (key value)
	       (setf (gethash key table) (round-to-decimal-places (* 100 (/ value total)) 2)))
	   table)))

;; Characters and Numbers

(defun is-alphabet(char)
  "Checks if char is a letter from the alphabet"
  (or (and (char>= char #\A) (char<= char #\Z))
      (and (char>= char #\a) (char<= char #\z))
      (char= char #\�)))

(defun round-to-decimal-places (number decimal-places)
  "Round number to decimal-places decimal places."
  (let ((factor (expt 10 decimal-places)))
    (if (zerop decimal-places)
	(/ (round (* number factor)) factor)
	(/ (float (round (* number factor))) factor))))
