;; Load Functions

(defun load-map(table)
  "Loads the information needed to the map *frequency-table*.
   The keys in the map will be the characters and the values will be the letter's frequency."
  (clrhash *frequency-table*)
  (loop :for character across *text*
	:when (is-alphabet character)
	  :do (incf (gethash character *frequency-table* 0)))
  (get-percentage *frequency-table*))

(defun load-data(pathname)
  "Gets ciphered text and stores the frequency of each letter in frequency table"
  (let ((out (make-string-output-stream)))
    (handler-case
	(with-open-file (stream pathname :direction :input
					 :if-does-not-exist :error)
	  (loop :for character = (read-char stream nil nil)
		:while character
		:do (princ character out)))
      (file-error (e)
	(format *error-output* "Error opening or reading file: ~a~%" e)))  
      (setf *text* (get-output-stream-string out))))
