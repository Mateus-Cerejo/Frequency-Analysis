;;;; Number Utility Functions

;;;; This file contains utility functions for number operations used throughout the project. It includes:
;;;;
;;;;     - Number Functions:
;;;;         - `round-to-decimal-places`: Rounds a number to a specified number of decimal places.
;;;;
;;;; Usage:
;;;;     The `round-to-decimal-places` function can be used to round numerical values 
;;;;     to a desired precision, which is useful in various mathematical and formatting contexts.
;;;;
;;;; Note:
;;;;     This file assumes the `utils` package is properly defined and used across 
;;;;     the project.

;;;; This file is part of Frequency-Based Cipher Deciphering
;;;;
;;;; Copyright (c) 2024 ludef4r and Mateus-Cerejo
;;;; Licensed under the MIT License. See LICENSE file for details.

;;; Package

(in-package :utils)

;;; Number Functions

(defun round-to-decimal-places (number decimal-places)
  "Round number to decimal-places decimal places."
  (let ((factor (expt 10 decimal-places)))
    (if (zerop decimal-places)
	(/ (round (* number factor)) factor)
	(/ (float (round (* number factor))) factor))))
