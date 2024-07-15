;;

(defun frequency-analyser (text language-frequency)
  (if (< (length text) 200)
	(format t "Your text has ~d characters, for a good analysis we recommend 200 or more characters!" (length text))
	)
  )