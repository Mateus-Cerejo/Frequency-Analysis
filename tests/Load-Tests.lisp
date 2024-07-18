(defun tests()
  "Run all tests"
  (test-load-map)
  (test-load-data))

(defun test-load-map()
  "Checks if the map is being loaded correctly")

(defun test-load-data()
  "Checks if *text* is being correctly loaded")
