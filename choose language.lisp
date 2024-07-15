;; Functions needed to get the language and respective abc frequency of that language 

;; The language frequency will be represented by a list of pairs, where each pair is a letter and the frequency (0% to 100%) 
;;; EX.: ((A 25.1)(B 6.4)... (Z 1.3))

(defun get-path ()
  "Returns default path"
  "c:/Users/mateu/OneDrive/Ambiente de Trabalho/"
  )

(defun get-language ()
 "Asks the user what language he wants to use. Returns the language frequency"
 (format t ".:*-*:._.:*-*:._.:*-*:._.:*-*:. ~%")
 (format t "Choose the language ~%")
 (format t "1 - Português ~%")
 (format t "2 - English ~%")
 (format t ".:*-*:._.:*-*:._.:*-*:._.:*-*:. ~%")

 (ecase (read-choice '(1 2))
   (1 (read-language "pt"))
   (2 (read-language "en"))
   )
 )

(defun read-language (language)
  "Trys to read the language frequency from a file. Returns the language frequency or nil if it doesn't exixt."
 (let* 
  (
   (in (open (concatenate 'string (get_path) language ".txt" ) :if-does-not-exist nil))
   (frequency nil)
   (counter 0)
   )
  (when in
	(loop for line = (append line (list (read in nil)))
		while (not (equal '(nil) line))
		do 
                (setq counter (+ counter 1))
                (cond 
                 ((zerop (mod counter 2)) (setq frequency (append frequency (list line))) (setq line nil))
                 )
		finally (close in)
	)
  )
   frequency
 )
)



(defun read-choice (options)
  "Recieves a list of options, for the user to choose from, outputs the users first valid option."
  (let ((choice (read)))
   (if (find choice options) 
    choice
    (progn (format t "Error, ~a is not a valid choice, try again.~%~%>" choice) (read-choice options))
   )
  )
)