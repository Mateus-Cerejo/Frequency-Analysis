(defsystem "frequency-analysis"
  :name "Frequency-Based Cipher Deciphering"
  :description "Frequency-Based Cipher Deciphering is a project aimed at breaking ciphers by analyzing letter frequencies in encrypted text."
  :long-description
   #.(uiop:read-file-string
       (uiop:subpathname *load-pathname* "README.md"))
  :version "0.1"
  :author ("ludef4r <luisdfm03@gmail.com.com>" "Mateus-Cerejo <your-email@example.com>")
  :maintainer ("ludef4r <your-email@example.com>" "Mateus-Cerejo <your-email@example.com>")
  :license "MIT"
  :homepage "https://github.com/Mateus-Cerejo/Frequency-Analysis"
  :components ((:module "src"
                :components
                ((:file "main")
                 (:module "interfaces"
                  :components ((:file "interfaces")))
                 (:module "scripts"
                  :components ((:file "load")
                               (:module "utils"
                                :components ((:file "numbers")
                                             (:file "characters")
                                             (:file "helpers")
                                             (:file "table")))))))
               (:module "data"
                :components ((:file "Ciphertext"))))) 

