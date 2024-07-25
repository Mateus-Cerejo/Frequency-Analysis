;;;; Load Functions

;;;; This file contains functions for loading data and populating a frequency 
;;;; table from text. It includes:
;;;;
;;;;     - `set-map`: Populates a hash table with the frequency of each character 
;;;;       in the provided text.
;;;;     - `data`: Reads the content of a file specified by a pathname into a 
;;;;       string, handling errors if the file does not exist or cannot be read.
;;;;
;;;; Usage:
;;;;     These functions are used to load and process the text data necessary 
;;;;     for the project's main functionality. Ensure that the `utils` package 
;;;;     is loaded before using these functions, as they rely on utility functions 
;;;;     from it.

;;;; This file is part of Frequency-Based Cipher Deciphering
;;;;
;;;; Copyright (c) 2024 ludef4r and Mateus-Cerejo
;;;; Licensed under the MIT License. See LICENSE file for details.

;;; Package

(in-package :load)

;;; Load Functions

(defun set-map(table text)
  "Loads the information needed to the table.
   The keys in table will be the characters and the values will be the letter's frequency."
  (clrhash table)
  (loop :for character across text
	:when (utils:alphabetp character)
	  :do (incf (gethash character table 0)))
  (utils:get-percentage table))

(defun data (pathname)
  "Opens the file in pathname and returns its content as a string.
   If the file in pathname doesn't exist, it signals an error."
  (assert (uiop:file-exists-p pathname) nil "File does not exist: ~a" pathname)
  (uiop:read-file-string pathname))
