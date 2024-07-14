(defun get-path(file)
  "Returns the path to the file"
  (concatenate 'string "~/Projects/SI-Project/" file))

(defun load-data(pathname)
  "Gets ciphered text while setting auxiliar variables"
  (with-open-file (stream pathname
			  :direction :input
			  :if-does-not-exist :error)
    (when stream
      (loop for character = (read-char stream nil nil)
	    while character do
	      (setf text (concatenate 'string text (string character)))
	    )))
  text)
