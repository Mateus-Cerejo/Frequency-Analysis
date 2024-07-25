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

(test load-map-test
    (let ((table (make-hash-table))
	  (text "abcdd"))
      (set-map table text)
      (is (equal 4 (hash-table-count table)) "Set Map Function: Expected size 4")
      (is (and (equal (gethash #\a table) 20.0)
	       (equal (gethash #\b table) 20.0)
	       (equal (gethash #\c table) 20.0)
	       (equal (gethash #\d table) 40.0)) "Set Map Function: Expected string 'abcdd' to have percentages 20, 20, 20, 40 respectively")))

(run! 'load-tests)
