
;; Globals

(defparameter text "")
(defparameter frequency-table (make-hash-table))

;; Main Function

(defun main()
  "Deciphers the text in ciphertext.txt"
  (load-data (get-path "ciphertext.txt")))
