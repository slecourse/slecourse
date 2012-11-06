import Pico.Recognizer
import Pico.Parser
import Pico.PrettyPrinter
import Pico.TypeChecker
import Pico.Interpreter
import Pico.Compiler
import Pico.Visualizer

main 
 = do
      bool <- recognize "../samples/factorial.pico"
      print bool
      Right ast <- parse "../samples/factorial.pico"
      print ast
      let pp = ppProgram ast
      print pp
      let errors = typeCheckProgram ast
      print errors
      let Just store = execProgram ast
      print store
      let code = compileProgram ast
      print code
      toFlowChart ast "../samples/factorial.dot"

-- Testing the type checker
      Right doubles <- parse "../samples/doubles.pico"
      print $ typeCheckProgram doubles
      Right undeclared <- parse "../samples/undeclared.pico"
      print $ typeCheckProgram undeclared
