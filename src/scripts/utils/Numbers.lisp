(defun round-to-decimal-places (number decimal-places)
  "Round number to decimal-places decimal places."
  (let ((factor (expt 10 decimal-places)))
    (if (zerop decimal-places)
	(/ (round (* number factor)) factor)
	(/ (float (round (* number factor))) factor))))
