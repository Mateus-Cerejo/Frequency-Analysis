;;;; Package Interfaces

;;;; This file defines the package interfaces for the project. It specifies the 
;;;; packages and the symbols they export. Each package corresponds to a module 
;;;; in the project and exports functions and variables that are used by other 
;;;; modules.
;;;;
;;;; Packages:
;;;;     - `:run`: Main package responsible for running the program.
;;;;     - `:load`: Package responsible for loading data and setting up the map.
;;;;     - `:utils`: Utility package providing various helper functions.
;;;;
;;;; Usage:
;;;;     These package definitions should be loaded before any source files that 
;;;;     use or reference the exported symbols. This ensures that all dependencies 
;;;;     are correctly resolved.

;;;; This file is part of Frequency-Based Cipher Deciphering
;;;;
;;;; Copyright (c) 2024 ludef4r and Mateus-Cerejo
;;;; Licensed under the MIT License. See LICENSE file for details.

;;; Interfaces

(defpackage :run
  (:use :cl)
  (:export :main))

(defpackage :load
  (:use :cl)
  (:export :set-map :data))

(defpackage :utils
  (:use :cl)
  (:export :alphabetp :round-to-decimal-numbers :print-table :table-values :get-percentage :get-path-to-files :ensure-constant))
