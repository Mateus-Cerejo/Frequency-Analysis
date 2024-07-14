(defun get-path(file)
  "Returns the path to the file"
  (concatenate 'string "~/Projects/SI-Project/" file))

(defun load-data(pathname)
  "Gets ciphered text and stores the frequency of each letter in frequency table"
  (let ((total 0))
    (with-open-file (stream pathname
			    :direction :input
			    :if-does-not-exist :error)
      (when stream
	(loop for character = (read-char stream nil nil)
	      while character do
		(setf text (concatenate 'string text (string character)))
		(let ((value (gethash character frequency-table))
		      (is-alphabet (or (and (char>= character #\A) (char<= character #\Z))
				       (and (char>= character #\a) (char<= character #\z))
				       (char= character #\�))))
		  (cond ((and (null value) is-alphabet)
			 (setf (gethash character frequency-table) 1)
			 (setf total (1+ total)))
			(is-alphabet
			 (setf (gethash character frequency-table) (+ value 1))
			 (setf total (1+ total))))))))
    total))
