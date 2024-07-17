(defun test-round-to-decimal-places()
  "Checks if the round number function correctly works"
  (cond ((and (equal 12 (round-to-decimal-places 12.1 0))
	      (equal 13 (round-to-decimal-places 12.6 0))
	      (equal 12 (round-to-decimal-places 12.5 0))
	      (equal 0.7404 (round-to-decimal-places 0.74036 4))
	      (equal 0.7403 (round-to-decimal-places 0.74032 4))
	      (equal 0.7404 (round-to-decimal-places 0.74035 4)))
	 (format t "Passed Test - Round To Decimal Places~%"))
	(t (format t "Failed Passed Test - Round To Decimal Places~%")
	   (format t "From 12.1 - Expected 12 and Got ~a~%" (round-to-decimal-places 12.1 0))
	   (format t "From 12.6 - Expected 13 and Got ~a~%" (round-to-decimal-places 12.6 0))
	   (format t "From 12.5 - Expected 12 and Got ~a~%" (round-to-decimal-places 12.5 0))
	   (format t "From 0.74036 - Expected 0.7404 and Got ~a~%" (round-to-decimal-places 0.74036 4))
	   (format t "From 0.74032 - Expected 0.7403 and Got ~a~%" (round-to-decimal-places 0.74032 4))
	   (format t "From 0.74035 - Expected 0.7404 and Got ~a~%" (round-to-decimal-places 0.74035 4)))))

(defun test-get-percentage()
  "Checks if all the percentages are being correctly calculated"

  ;; Set table
  (clrhash frequency-table)
  (setf (gethash 'a frequency-table) 5)
  (setf (gethash 'b frequency-table) 15)
  (setf (gethash 'c frequency-table) 10)
  (setf (gethash 'd frequency-table) 20)

  ;; Test Function
  (let ((total (reduce #'+ (hash-table-values frequency-table))))
    (get-percentage total))
  (let ((total-percentage (reduce #'+ (hash-table-values frequency-table))))
    (cond ((and (equal (gethash 'a frequency-table) (* (/ 5 50) 100))
		(equal (gethash 'b frequency-table) (* (/ 15 50) 100))
		(equal (gethash 'c frequency-table) (* (/ 10 50) 100))
		(equal (gethash 'd frequency-table) (* (/ 20 50) 100))
		(equal total-percentage 100))
	   (format t "Passed Test - Get Percentage~%"))
	  (t (format t "Failed Test - Get Percentage~%")
	     (format t "Total Percentage expected: 100%~%")
	     (format t "Total Percentage obtained: ~a~%" total-percentage)
	     (format t "Map values:~%")
	     (print-frequency-table)))))

(defun tests()
  "Run all tests"
  (test-round-to-decimal-places)
  (test-get-percentage))
