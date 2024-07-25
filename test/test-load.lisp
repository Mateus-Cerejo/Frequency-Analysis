(ql:quickload "fiveam")

(defpackage :load-test
  (:use :cl :fiveam :load))

(in-package :load-test)

(def-suite load-tests
  :description "Tests for the load file")

(in-suite load-tests)

(test load-data-test
  (let* ((pathname "~/Projects/SI-Project/test/data/test.txt")
	 (result (string-trim '(#\Newline #\Space #\Tab) (data pathname)))
	 (content "This is a test file."))
    (is (string= result content) "Data function: Expected 'This is a test file.'")))

(test load-data-test-nonexistent-file
  (let ((pathname "~/Projects/SI-Project/test/data/nonexistent.txt"))
    (handler-case
	(progn
	  (data pathname)
	  (fail "Data function: Expected an assertion error when file does not exist"))
      (error (e)
	(pass)))))

(def-test load-map-test
  )

(run! 'load-tests)
