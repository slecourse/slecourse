# Summary 

All these examples have been extracted from the LLVM documentation http://llvm.org/docs/tutorial/index.html They are only provided here for convenience / simplicity of access. The underlying code is also somehow packaged with the code distribution of LLVM, but the present C++ code and sample code has been extracted right away from the documentation.

The examples are part of the tutorial whose purpose is summarized by the documentation as follows: "The goal of this tutorial is to progressively unveil our language, describing how it is built up over time. This will let us cover a fairly broad range of language design and LLVM-specific usage issues, showing and explaining the code for it all along the way, without overwhelming you with tons of details up front." http://llvm.org/docs/tutorial/LangImpl1.html

The corresponding language is called Kaleidoscope.

# Processors

See subdirectory "processors"; these are processors for the Kaleidoscope language.

* parser: This is a basic parser for Kaleidscope. It is written in plain C++ code and it uses the common style of a recursive descent parsing with an extra lexer. The result of parsing is represented with objects according to a very simple object model for Kaleidoscope. The rest of the processors basically include this sort of parser. The processor with support for user-defined operators appropriately extends the parsing approach.
* codegen: The AST of a Kaleiscope program is transformed into LLVM IR. In this manner, basic idioms of LLVM IR usage are encountered. For instance, uniqued literals and types are encountered as well as the use of data structures for managing blocks, SSA registers.
* jit: This is really a combinbation of two major ideas. First, a number of standard optimizations is enabled. Second, JIT behavior is turned on for the top-level expressions, thereby enabling immediate evaluation of function applications. 
* cflow: Control-flow constructs for if-then-else and loops are enabled. Thus, code generation gets more involved in that multiple basic blocks need to be constructed and connected through jumps.
* operators: Precedence parsing is used to support user-defined operators in the language. In terms of code generation, such (unary and binary) operators are essentially handled like regular functions. The resulting expressiveness is also well suited to demonstrate the utility of extern functions that can be used within Kaleidoscope.
* mvars: Mutable variables are enabled, thereby making the transition from a pure functional language to an imperative language. At the IR end of things, this requires the use of stack-allocated memory as opposed SSA-form variables.

# Samples

See subdirectory "samples"; these are samples in the Kaleidoscope language.

* inc: The increment function. It demonstrates a very trivial function definition with a trivial binary expression as its body.
* fib: The Fibonacci sequence as a naively exponential function. It certainly demonstrates functional style and recursion as well as control-flow with if-then-else.
* fibi: The Fibonacci sequence as an optimized function. It uses mutable variables to derive the result in an incremental manner. (Of course, this could be done without mutable variables as well.)
* trivialConstantFolding: A function that can be optimized by simple constant folding, actually, in a manner that such folding can happen during the construction of IR.
* constantFolding: A function that can be optimized by somewhat more advanced constant folding---requiring a designated optimizing as opposed to simply manipulating IR in a clever way.
* mandelbrot: A function that uses ASCII art to draw some Mandelbrot sets. The function relies on external functions and user-defined operators.
