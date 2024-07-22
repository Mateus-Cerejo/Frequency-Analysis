;;; Package

(in-package :run)

;;; Constants

(utils:ensure-constant '+ciphertext+ "Ciphertext.txt")

;;; Main Function

(defun main()
  "Deciphers the text in ciphertext.txt"
  (let ((text "")
	(frequency-table (make-hash-table :test 'eql)))
    (load:data (utils:get-path-to-files +ciphertext+ "/data/") text)
    (load:set-map frequency-table text)
    frequency-table))
