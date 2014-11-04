import json
import antlr3
from FsmlLexer import FsmlLexer
from FsmlParser import FsmlParser
from ConstraintChecker import ok
from Simulator import simulateFSM
from CodeGenerator import generateCode
from Drawer import drawFSM
from FsmExceptions import FsmException, FsmParseException

def parseFSM(path):
    char_stream = antlr3.ANTLRInputStream(open(path))
    lexer = FsmlLexer(char_stream)
    tokens = antlr3.CommonTokenStream(lexer)
    parser = FsmlParser(tokens)
    parser.fsm()
    return parser.fsmObject


def main():
    try:
        fsm = parseFSM("./sample.fsml")
        sampleInput = json.load(open("./sample_input.json", "r"))

        # just for visualization of the fsm dict (not needed anywhere in the code)
        jsonFile = open("./sample_fsml.json", 'w')
        jsonFile.write(json.dumps(fsm))

        # check the ok constraints
        ok(fsm)
        #simulate the fsm
        output = simulateFSM(fsm, sampleInput)
        # dump the simulation output to file
        outFile = open("./sample_output.json", 'w')
        outFile.write(json.dumps(output))

        #generate Code
        generateCode(fsm)

        #draw fsm
        drawFSM(fsm)

    except FsmException:
        raise



if __name__ == '__main__':
    main()