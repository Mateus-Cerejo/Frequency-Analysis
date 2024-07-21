;;; Globals

(defparameter *text* "")
(defparameter *frequency-table* (make-hash-table :test 'eql))

;;; Constants

(defconstant +ciphertext-file+ "Ciphertext.txt")

;;; Imports

(load "src/scripts/Load.lisp")

;;; Main Function

(defun main()
  "Deciphers the text in ciphertext.txt"
  (load-data (get-path +ciphertext-file+) *text*)
  (load-map *frequency-table* *text*))
