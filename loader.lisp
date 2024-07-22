;;; Package

(in-package :loader-project)

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
  (compile-and-load "src/scripts/utils/path.lisp")
  (compile-and-load "src/scripts/utils/character.lisp")
  (compile-and-load "src/scripts/utils/number.lisp")
  (compile-and-load "src/scripts/utils/table.lisp")
  (compile-and-load "src/scripts/load.lisp")
  (compile-and-load "src/main.lisp"))
