;;;; Main Program File

;;;; This file contains the main function for the program. It sets up the necessary
;;;; constants and includes the primary function to decipher the text from a given file.
;;;; The main steps include:
;;;;
;;;;     - Constants: Ensures that the constant +ciphertext+ is set up.
;;;;     - Main Function: 
;;;;         - `main`: Loads the data from the ciphertext file, processes it, and 
;;;;           populates a frequency table with the results.
;;;;
;;;; Usage:
;;;;     Call `main` to initialize and run the deciphering process. This function
;;;;     reads the input file, processes the text, and returns the frequency table
;;;;     of the deciphered text.

;;;; This file is part of Frequency-Based Cipher Deciphering
;;;;
;;;; Copyright (c) 2024 ludef4r and Mateus-Cerejo
;;;; Licensed under the MIT License. See LICENSE file for details.

;;; Package

(in-package :run)

;;; Constants

(utils:ensure-constant '+ciphertext+ "Ciphertext.txt")

;;; Main Function

(defun main()
  "Deciphers the text in ciphertext.txt"
  (let ((text "")
	(frequency-table (make-hash-table :test 'eql)))
    (load:data (utils:get-path-to-files +ciphertext+ "/data/") text)
    (load:set-map frequency-table text)
    frequency-table))
