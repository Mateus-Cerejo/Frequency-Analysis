;;; Package

(in-package :load)

;;; Load Functions

(defun set-map(table text)
  "Loads the information needed to the table.
   The keys in table will be the characters and the values will be the letter's frequency."
  (clrhash table)
  (loop :for character across text
	:when (utils:alphabetp character)
	  :do (incf (gethash character table 0)))
  (utils:get-percentage table))

(defun data(pathname str)
  "Opens the file in pathname and store its content in str.
   If file in pathname doens't exist, it prints an error message"
  (let ((out (make-string-output-stream)))
    (handler-case
	(with-open-file (stream pathname :direction :input
					 :if-does-not-exist :error)
	  (loop :for character = (read-char stream nil nil)
		:while character
		:do (princ character out)))
      (file-error (e)
	(format *error-output* "Error opening or reading file: ~a~%" e)))  
      (setf str (get-output-stream-string out))))
