(in-package :loader-project)

(defun load-all-files()
  "Loads all the necessary files in the project, in correct order"
  (load (compile-file "src/scripts/utils/path.lisp"))
  (load (compile-file "src/scripts/utils/character.lisp"))
  (load (compile-file "src/scripts/utils/number.lisp"))
  (load (compile-file "src/scripts/utils/table.lisp"))
  (load (compile-file "src/scripts/load.lisp"))
  (load (compile-file "src/main.lisp")))
