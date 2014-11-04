Python implementation of the Finite State Machine Language
==========================================================

prerequisites : 

antlr python runtime v.3.1 (http://www.antlr3.org/download/Python/antlr_python_runtime-3.1.tar.gz)
jinja2 package (http://jinja.pocoo.org/docs/intro/#installation)
pygraphviz package (https://pypi.python.org/pypi/pygraphviz) & an installation of graphviz on your system


run "make build" to build the project and "make run" to run it

"make run" does the following : 
1) Parsing the sample.fsml and dumping it to "sample_fsml.json" for better visualization
2) Checking the Ok constraints
3) Simulating the FSM with the "sample_input.json" and dumping the output to "sample_output.json"
4) Generating Python Code (TurnstileHandler_generated.py & TurnstileStepper_generated.py)
5) Drawing the FSM in "sample_graph.pdf"

"make clean" deletes all generated Files and "make test" is running the test cases

