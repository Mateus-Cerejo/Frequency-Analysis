(defun get-path(file)
  "Returns the path to the file"
  (concatenate 'string "~/Projects/SI-Project/" file))

(defun is-alphabet(char)
  "Checks if char is a letter from the alphabet"
  (or (and (char>= char #\A) (char<= char #\Z))
      (and (char>= char #\a) (char<= char #\z))))

(defun set-map()
  "Loads the information needed to the map.
   The keys in the map will be the characters and the values will be the letter's frequency."
  (loop for character across text
	do (let ((value (gethash character frequency-table))
		 (is-alpha (or (is-alphabet character) (char= character #\�))))
	     (cond ((and is-alpha (null value)) (setf value 1))
		   (is-alpha (setf value (1+ value))))
	     (if is-alpha (setf (gethash character frequency-table) value))))
  (let ((total 0))
    (maphash (lambda (_ value) (setf total (+ total value))) frequency-table)
    (get-percentage total)))

(defun load-data(pathname)
  "Gets ciphered text and stores the frequency of each letter in frequency table"
  (with-open-file (stream pathname
			  :direction :input
			  :if-does-not-exist :error)
    (when stream
      (loop for character = (read-char stream nil nil)
	    while character do
	      (setf text (concatenate 'string text (string character)))))))
