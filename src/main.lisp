;;; Globals

(defparameter *text* "")
(defparameter *frequency-table* (make-hash-table :test 'eql))

;;; Constants

(defconstant +ciphertext-file+ "Ciphertext.txt")

;;; Imports

(load "src/scripts/utils/path.lisp")
(load "src/scripts/load.lisp")

;;; Main Function

(defun main()
  "Deciphers the text in ciphertext.txt"
  (load-data (get-path-to-files +ciphertext-file+ "/data/") *text*)
  (load-map *frequency-table* *text*))
