;;; Globals

(defparameter *text* "")
(defparameter *frequency-table* (make-hash-table :test 'eql))

;;; Constants

(defconstant +ciphertext-file+ "Ciphertext.txt")

;;; Main Function

(defun main()
  "Deciphers the text in ciphertext.txt"
  (load-data (get-path-to-files +ciphertext-file+ "/data/") *text*)
  (load-map *frequency-table* *text*))
