(defun tests()
  "Run all tests"
  (test-table-values)
  (test-get-percentage)
  (test-is-alphabet)
  (test-round-to-decimal-places))

;; Test Map functions

(defun test-table-values()
  "Checks if all the values in table are being returned correctly"
  (let ((table (make-hash-table :test 'eql)))
    (assert (equal (table-values table) '()) nil (format nil "Failed Test - Table Values~%Expected ()~%Got ~a~%" (table-values table)))

    (setf (gethash 'a table) 1)
    (setf (gethash 'b table) 2)
    (setf (gethash 'c table) 3)
    (assert (equal (table-values table) '(1 2 3)) nil (format nil "Failed Test - Table Values~%Expected (1, 2, 3)~%Got ~a~%" (table-values table))))
  (format t "Passed Test - Table Values~%"))

(defun test-get-percentage()
  "Checks if all the percentages are being correctly calculated"

  ;; Set table
  (clrhash *frequency-table*)
  (setf (gethash 'a *frequency-table*) 5)
  (setf (gethash 'b *frequency-table*) 15)
  (setf (gethash 'c *frequency-table*) 10)
  (setf (gethash 'd *frequency-table*) 20)

  ;; Test Function
  (let ((total (reduce #'+ (table-values *frequency-table*))))
    (get-percentage *frequency-table*)
    (let ((total-percentage (reduce #'+ (table-values *frequency-table*))))
      (cond ((and (equal (gethash 'a *frequency-table*) (round-to-decimal-places (* (/ 5  total) 100) 2))
		  (equal (gethash 'b *frequency-table*) (round-to-decimal-places (* (/ 15 total) 100) 2))
		  (equal (gethash 'c *frequency-table*) (round-to-decimal-places (* (/ 10 total) 100) 2))
		  (equal (gethash 'd *frequency-table*) (round-to-decimal-places (* (/ 20 total) 100) 2))
		  (equal (round-to-decimal-places total-percentage 0) 100))
	     (format t "Passed Test - Get Percentage~%"))
	    (t (format t "Failed Test - Get Percentage~%")
	       (format t "Total Percentage expected: 100%~%")
	       (format t "Total Percentage obtained: ~a%~%" (round-to-decimal-places total-percentage 0))
	       (format t "Map values:~%")
	       (print-table *frequency-table*))))))

;; Test Characters and Numbers functions

(defun test-is-alphabet()
  "Checks if the is alphabet function correctly works)"
  (loop :for character :in '(#\a #\b #\c #\d #\e #\f #\g #\h #\i #\j #\k #\l #\m
			     #\n #\o #\p #\q #\r #\s #\t #\u #\v #\w #\x #\y #\z
			     #\A #\B #\C #\D #\E #\F #\G #\H #\I #\J #\K #\L #\M
			     #\N #\O #\P #\Q #\R #\S #\T #\U #\V #\W #\X #\Y #\Z)
	:do (assert (is-alphabet character) (character) (format nil "Failed Test - Is Alphabet~%Letter ~a failed~%" character)))
  (assert (not (is-alphabet #\.)) nil "Failed Test - Is Alphabet~% Dot '.' is not a letter")
  (format t "Passed Test - Is Alphabet~%"))

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
