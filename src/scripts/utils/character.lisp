;;; Character Functions

(defun is-alphabet(char)
  "Checks if char is a letter from the alphabet"
  (or (and (char>= char #\A) (char<= char #\Z))
      (and (char>= char #\a) (char<= char #\z))
      (char= char #\�)))
