
;; Globals

(defparameter text "")
(defparameter frequency-table (make-hash-table :test 'eql))

;; Main Function

(defun main()
  "Deciphers the text in ciphertext.txt"
  (load-data (get-path "ciphertext.txt"))
  (set-map))
