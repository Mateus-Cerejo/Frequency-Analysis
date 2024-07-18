(defun tests()
  "Run all tests"
  (test-load-data)
  (test-load-map))

(defun test-load-map()
  "Checks if the map is being loaded correctly"
  (load-data (get-path "tests/test.txt"))
  (load-map)
  (cond ((equal 25.0 (gethash #\l *frequency-table*)) (format t "Passed Test - Load Map~%"))
	(t (format t "Failed test - Load Map~%")
	   (format t "Expected 25.0~%")
	   (format t "Got ~a~%" (gethash #\l *frequency-table*)))))


(defun remove-newlines (str)
  "Remove all newline characters from the string STR."
  (remove #\Newline str :count nil :from-end nil :start 0 :end nil :key #'identity :test #'char=))

(defun test-load-data()
  "Checks if *text* is being correctly loaded"
  (load-data (get-path "tests/test.txt"))
  (cond ((string= (remove-newlines *text*) "Hello World! xD") (format t "Passed Test - Load Data~%"))
	(t (format t "Failed Test - Load Data~%")
	   (format t "Expected 'Hello World! xD'~%")
	   (format t "Got '~a'~%" *text*))))
