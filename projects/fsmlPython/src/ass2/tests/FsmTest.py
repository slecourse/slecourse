import json
import sys
import unittest

sys.path.append('..')
from ConstraintChecker import ok
from MainFSM import parseFSM
from FsmExceptions import *
from Simulator import simulateFSM

# test cases for the OK constraints

class TestOkConstraints(unittest.TestCase):

    def setUp(self):
        self.determinismNotOkFsm = parseFSM("./determinismNotOk.fsml")
        self.idsNotOkFsm = parseFSM("./idsNotOk.fsml")
        self.initialNotOkFsm = parseFSM("./initialNotOk.fsml")
        self.reachabilityNotOkFsm = parseFSM("./reachabilityNotOk.fsml")
        self.resolutionNotOkFsm = parseFSM("./resolutionNotOk.fsml")

    def testDeterminism(self):
        self.assertRaises(DeterministicException, ok, self.determinismNotOkFsm)
    def testDistinctIDs(self):
        self.assertRaises(DistinctIdsException, ok, self.idsNotOkFsm)
    def testSingleInitial(self):
        self.assertRaises(SingleInitialException, ok, self.initialNotOkFsm)
    def testReachability(self):
        self.assertRaises(ReachableException, ok, self.reachabilityNotOkFsm)
    def testResolution(self):
        self.assertRaises(ResolvableException, ok, self.resolutionNotOkFsm)

# test cases for the other constraints

class TestOtherConstraints(unittest.TestCase):

    def setUp(self):
        self.parserErrorFsm = "./parserError.fsml"

        self.correctFsm = parseFSM("../sample.fsml")
        self.illegalSymbolInput = json.load(open("illegalSymbol_input.json"))
        self.infeasibleSymbolInput = json.load(open("infeasibleSymbol_input.json"))

    def testParserError(self):
        self.assertRaises(FsmParseException, parseFSM, self.parserErrorFsm)
    def testIllegalSymbol(self):
        self.assertRaises(IllegalSymbolException, simulateFSM, self.correctFsm, self.illegalSymbolInput)
    def testInfeasibleSymbol(self):
        self.assertRaises(InfeasibleSymbolException, simulateFSM, self.correctFsm, self.infeasibleSymbolInput)


# tests if the baseline output is the same as the output which is produced by the Simulator.py module
# and if this output is also the same as the output which is produced by the generated modules

class TestSimulationOutput(unittest.TestCase):

    def setUp(self):
        # import the generated Code
        import TurnstileHandler_generated
        import TurnstileStepper_generated
        self.stepper = TurnstileStepper_generated.Stepper()
        self.input = json.load(open("../sample_input.json"))
        self.fsm = parseFSM("../sample.fsml")

    def testSimulationOutput(self):
        # load the base line output
        correctJsonOutput = json.load(open("../baseline_output.json"))

        # produce the output of the generated modules
        generatedJsonOutput = self.stepper.simulateFSM_generated(self.input)

        # produce the output of the hand-written simulator module
        simulatedJsonOutput = simulateFSM(self.fsm, self.input)

        # assert all 3 types of output are equal
        self.assertEqual(correctJsonOutput, simulatedJsonOutput)
        self.assertEqual(correctJsonOutput, generatedJsonOutput)

if __name__ == '__main__':
    unittest.main()
