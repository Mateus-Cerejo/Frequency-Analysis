;;;; Utility Functions

;;;; This file contains utility functions used throughout the project. It includes:
;;;;
;;;;     - Path Functions:
;;;;         - `get-path-to-files`: Returns the full path to a file, optionally including a folder.
;;;;     - Constant Functions:
;;;;         - `ensure-constant`: Initializes a constant if it doesn't already exist.
;;;;
;;;; Usage:
;;;;     These utility functions are meant to be used by other parts of the project 
;;;;     to perform common operations. The `get-path-to-files` function, for example, 
;;;;     is used to construct file paths dynamically, and the `ensure-constant` function 
;;;;     ensures that constants are defined safely.
;;;;
;;;; Note:
;;;;     This file assumes the `utils` package is properly defined and used across 
;;;;     the project.

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
