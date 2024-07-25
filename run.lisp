;;;; Program Runner

;;;; This file contains the `run` function that orchestrates the loading and execution
;;;; of the entire program. It includes:
;;;;
;;;;     - Function:
;;;;         - `run`: Loads the loader script, compiles and loads all necessary files, and
;;;;           then executes the main function of the program.
;;;;
;;;; Usage:
;;;;     Call `run` to initialize and run the entire program. This function ensures
;;;;     that all dependencies are loaded and compiled before executing the main function.

;;;; This file is part of Frequency-Based Cipher Deciphering
;;;;
;;;; Copyright (c) 2024 ludef4r and Mateus-Cerejo
;;;; Licensed under the MIT License. See LICENSE file for details.

;;; Function

(defun run()
  "Runs all the commands to show the program working.
   It first loads the loader script, then compiles and loads all necessary files,
   and finally runs the main function of the program."
  (load "loader.lisp")
  (load-all-files))
