;;; Package

(in-package :run)

;;; Constants

(defconstant +ciphertext-file+ "Ciphertext.txt")

;;; Main Function

(defun main()
  "Deciphers the text in ciphertext.txt"
  (let ((text "")
	(frequency-table (make-hash-table :test 'eql)))
    (load:data (utils:get-path-to-files +ciphertext-file+ "/data/") text)
    (load:set-map frequency-table text)
    frequency-table))
