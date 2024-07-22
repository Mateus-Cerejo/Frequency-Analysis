;;;; Load Functions

;;;; This file contains functions for loading data and populating a frequency 
;;;; table from text. It includes:
;;;;
;;;;     - `set-map`: Populates a hash table with the frequency of each character 
;;;;       in the provided text.
;;;;     - `data`: Reads the content of a file specified by a pathname into a 
;;;;       string, handling errors if the file does not exist or cannot be read.
;;;;
;;;; Usage:
;;;;     These functions are used to load and process the text data necessary 
;;;;     for the project's main functionality. Ensure that the `utils` package 
;;;;     is loaded before using these functions, as they rely on utility functions 
;;;;     from it.

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
