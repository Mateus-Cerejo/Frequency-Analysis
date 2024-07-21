;;; Path Functions

(defun get-path-to-files(filename &optional folder)
  "Returns filename concatenated with the path and, if provided, the folder/s, to it"
  (concatenate 'string "~/Projects/SI-Project/" folder filename))
