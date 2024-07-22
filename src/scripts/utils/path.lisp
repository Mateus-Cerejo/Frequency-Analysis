;;; Package

(in-package :utils)

;;; Path Functions

(defun get-path-to-files(filename &optional folder)
  "Returns filename concatenated with the path and, if provided, the folder/s, to it"
  (concatenate 'string "~/Projects/SI-Project/" folder filename))

;;; Constant Functions

(defun ensure-constant(name value &optional docstring)
  "Initializes a constant with name, value and docstring attributes if it doesn't exist already"
  (unless (boundp name)
    (eval `(defconstant ,name ,value ,docstring))))
