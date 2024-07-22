# Frequency-Based Cipher Deciphering

**TL;DR:**

Frequency-Based Cipher Deciphering is a project aimed at breaking ciphers by analyzing letter frequencies in encrypted text. 

**Overview:**

The primary objective is to decode ciphered messages by substituting letters based on their frequency of occurrence. This approach involves:

* **Frequency Analysis:** Analyzing the frequency of each letter in the encrypted text to build a frequency table.
* **Substitution Strategy:** Testing various substitutions based on common letters and patterns in the target language to decode the text.
* **Phrase Formation:** Iteratively substituting letters to form coherent phrases and words, leveraging common linguistic patterns.

**Key Features:**

* **Data Loading:** Import and process ciphered text files to extract raw data.
* **Frequency Calculation:** Compute the frequency of each letter and convert these frequencies into percentage occurrences.
* **Deciphering Algorithm:** Employ a substitution strategy where letters are replaced with common letters from the language, aiming to reveal readable text.
* **Word Verification:** Check the deciphered output against a dictionary or list of valid words to ensure that substitutions produce meaningful phrases.

**Usage:**

1. **Load Ciphered Text:** Use the `load-data` function to read and process the ciphered text from a file.
2. **Analyze Frequencies:** Run the `load-map` function to generate a frequency table of the letters in the ciphered text.
3. **Apply Substitutions:** Use the deciphering logic to iteratively substitute letters based on their frequency, adjusting as needed to form valid phrases.
4. **Evaluate Results:** Check the deciphered text for readability and accuracy by comparing against known words or phrases.

**Motivation:**

The motivation behind this project is twofold. 
Firstly, it provided valuable experience and learning opportunities in cryptography and computational linguistics. 
Secondly, it aims to streamline the process of deciphering encoded messages by applying statistical analysis and linguistic patterns. 
By automating the frequency analysis and substitution process, this project seeks to make cipher decryption more accessible and efficient.

**License**

This file is part of Frequency-Based Cipher Deciphering.

Copyright (c) 2024 ludef4r and Mateus-Cerejo
Licensed under the MIT License. See LICENSE file for details.
