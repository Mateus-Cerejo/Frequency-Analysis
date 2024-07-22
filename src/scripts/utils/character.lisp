;;;; Utility Functions

;;;; This file contains utility functions used throughout the project. It includes:
;;;;
;;;;     - Character Functions:
;;;;         - `alphabetp`: Checks if a character is a letter from the alphabet.
;;;;
;;;; Usage:
;;;;     These utility functions are meant to be used by other parts of the project 
;;;;     to perform common operations. The `alphabetp` function, for example, is used 
;;;;     to determine if a character is alphabetic.
;;;;
;;;; Note:
;;;;     This file assumes the `utils` package is properly defined and used across 
;;;;     the project.

;;; Package

(in-package :utils)

;;; Character Functions

(defun alphabetp(char)
  "Checks if char is a letter from the alphabet"
  (or (and (char>= char #\A) (char<= char #\Z))
      (and (char>= char #\a) (char<= char #\z))
      (char= char #\�)))
