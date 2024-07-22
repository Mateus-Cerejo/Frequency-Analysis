;;;; Compilation and Loading Utilities

;;;; This file contains functions for managing the compilation and loading
;;;; of Lisp source files within the project. It includes:
;;;; 
;;;;     - Constants: Definitions for the directory and file extension used
;;;;       for storing compiled files.
;;;;     - Functions:
;;;;         - `compile-and-load`: Compiles a source file into a specified directory
;;;;           and then loads the compiled file. Ensures that the target directory
;;;;           exists before compiling.
;;;;         - `load-all-files`: Compiles and loads a list of source files in a
;;;;           specific order to ensure that dependencies are resolved correctly.
;;;; 
;;;; Usage:
;;;;     Call `load-all-files` to compile and load all necessary files for the
;;;;    project, ensuring that all dependencies are properly resolved.


;;;; This file is part of Frequency-Based Cipher Deciphering
;;;;
;;;; Copyright (c) 2024 ludef4r and Mateus-Cerejo
;;;; Licensed under the MIT License. See LICENSE file for details.

;;; Constants

(defconstant +compiled-dir+ (merge-pathnames "compiled/" (truename ".")))
(defconstant +compiled-extension+ "fasl")

;;; Functions

(defun compile-and-load(source)
  "Compile and load the source file, storing the compiled file in the specified directory."
  (ensure-directories-exist +compiled-dir+)
  (let ((compiled (merge-pathnames (make-pathname :name (pathname-name source)
						  :type +compiled-extension+
						  :version (pathname-version source))
				   +compiled-dir+)))
    (compile-file source :output-file compiled)
    (load compiled)))

(defun load-all-files()
  "Loads all the necessary files in the project, in correct order"
  (compile-and-load "src/interfaces/interfaces.lisp")
  (compile-and-load "src/scripts/utils/helpers.lisp")
  (compile-and-load "src/scripts/utils/character.lisp")
  (compile-and-load "src/scripts/utils/number.lisp")
  (compile-and-load "src/scripts/utils/table.lisp")
  (compile-and-load "src/scripts/load.lisp")
  (compile-and-load "src/main.lisp"))
