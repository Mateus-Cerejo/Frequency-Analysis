(defun test-get-path()
  "Checks if the path is correct"                                                                      
  (let* ((file "Test.lisp")                                                                            
        (expectedPath (concatenate 'string "~/Projects/SI-Project/" file)))                            
    (cond ((string= expectedPath (get-path file)) (format t "Passed Test - Get-Path"))
          (t (format t "Failed to get the correct path~%")
	     (format t "Expected ~a~%" expectedPath)
	     (format t "Value ~a~%" (get-path file))))))


(defun tests()
  "Run all tests"
  (test-get-path))
