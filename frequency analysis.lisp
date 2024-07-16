;;

(defun frequency-analyser (language-frequency)
  (if (< (length text) 200)
		(format t "Your text has ~d characters, for a good analysis we recommend 200 or more characters!" (length text))
	)
  (get-swap-map (hashtable-to-ordered-list language-frequency) (order-frequency language-frequency))
  (swap-letters text)
  )

(defun teste ()
  (let ((language-frequency (get-language)))
      (get-swap-map (hashtable-to-ordered-list language-frequency) language-frequency)
      )
  )

(defun swap-letters (ciphered)
  (cond
   ((equal ciphered "") "")
   ((null (gethash (intern (string (char ciphered 0))) swap-table)) 
    (concatenate 'string (string (char ciphered 0)) (swap-letters (subseq ciphered 1))))
   (t (concatenate 'string (string (gethash (intern (string (char ciphered 0))) swap-table)) (swap-letters (subseq ciphered 1))))
   )
  )

(defun get-swap-map (ordered-text-frequency ordered-language-frequency)
  (cond 
   ((null ordered-language-frequency) nil)
   (t (setf (gethash (get-letter (first ordered-text-frequency)) swap-table) (get-letter (first ordered-language-frequency)))
            (get-swap-map (cdr ordered-text-frequency) (cdr ordered-language-frequency))
            (print (get-letter (first ordered-text-frequency)) ) (print (get-letter (first ordered-language-frequency))))
   )
)

(defun hashtable-to-ordered-list (language-frequency)
  (cond
   ((null language-frequency) nil)
   (t (insert-ordered (cons (get-letter (first language-frequency)) 
                            (list (gethash (symbol-to-char (get-letter (first language-frequency))) frequency-table))) (hashtable-to-ordered-list (cdr language-frequency))))
   
   )
  )

(defun symbol-to-char (symb)
  (char (symbol-name symb) 0)
  )

(defun insert-ordered (elem lista)
  (cond
   ((null lista) (list elem))
   ((< (get-freq (first lista)) (get-freq elem)) (cons elem lista))
   (t (cons (first lista) (insert-ordered elem (cdr lista))))
   )
  )

(defun order-frequency (freq)
  (cond 
   ((null (first freq)) nil)
   (t (insert-ordered (first freq) (order-frequency (cdr freq))))
   )
  )

(defun get-letter (elem)
  (first elem)
  )

(defun get-freq (elem)
  (if (null (second elem)) 0 (second elem))
  )

