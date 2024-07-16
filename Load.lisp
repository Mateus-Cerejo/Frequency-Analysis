(defun get-path(file)
  "Returns the path to the file"
  (concatenate 'string "~/Projects/SI-Project/" file))

(defun hash-table-values(table)
  "Returns a list with all the values of table"
  (let ((result '()))
    (maphash (lambda (_ value) (push value result)) table)
    (nreverse result)))

(defun set-map()
  "Loads the information needed to the map.
   The keys in the map will be the characters and the values will be the letter's frequency."
  (clrhash frequency-table)
  (loop for character across text
	when (is-alphabet character)
	  do (incf (gethash character frequency-table 0)))
  (let ((total (reduce '+ (hash-table-values frequency-table))))
    (get-percentage total)))

(defun load-data(pathname)
  "Gets ciphered text and stores the frequency of each letter in frequency table"
  (setf text "")
  (with-open-file (stream pathname
			  :direction :input
			  :if-does-not-exist :error)
    (when stream
      (loop for character = (read-char stream nil nil)
	    while character do
	      (setf text (concatenate 'string text (string character)))))))
