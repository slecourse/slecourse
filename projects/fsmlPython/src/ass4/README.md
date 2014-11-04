Test Data Generation
====================

This project generates test data for the fsml implemenation of assignment2. After generation, the testdata is located in the "testdata" folder, in which the subfolder "negative" contains subfolders for each specific testing error. The subfolder "positive" contains only valid *.fsml and input files.
Use "make run" to run the positive and negative test cases with depth=7. You can adjust the value for depth by running the command "make depth="X" run". If you want to run the code of "PositiveTests.py" or "NegativeTests.py" without the makefile, make sure you have built the project of assignment2 before.

Prerequisites

- See ass2
- Also, nltk is needed: sudo easy_install nltk -- Which version?
