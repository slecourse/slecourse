import glob
import json
import os
import sys
import unittest

sys.path.append("../ass2")

from MainFSM import parseFSM
from ConstraintChecker import ok
from FsmExceptions import *
from CorrectDataGenerator import generatePositiveTestData
from Simulator import simulateFSM
from CodeGenerator import generateCode

# Code for testing all valid fsml files

class positiveOkTestCase(unittest.TestCase):

    def __init__(self, fsmlFile):
        unittest.TestCase.__init__(self, methodName='testOneFile')
        self.fsmlFile = fsmlFile

    def testOneFile(self):
        fsm = parseFSM(self.fsmlFile)
        self.assertTrue(ok(fsm))

    def shortDescription(self):
        return 'TestCase for file %s' % self.fsmlFile

def fsmlTestSuite(depth):
    print "Running positive *.fsml Test Cases"
    # delete old test data
    for path, _, files in os.walk("./testdata"):
        for testfile in files:
            if not testfile == ".gitignore":
                os.remove(os.path.join(path, testfile))

    # generate new test data
    generatePositiveTestData(depth)

    fsmlFiles = glob.glob('./testdata/positive/fsm/*.fsml')
    return unittest.TestSuite([positiveOkTestCase(fsmlFile) for fsmlFile in fsmlFiles])

# Code for testing all valid input files and comparing them to the correct output files

class positiveOutputTestCase(unittest.TestCase):
    def __init__(self, fsmlFile, inputFile, correctOutputFile):
        unittest.TestCase.__init__(self, methodName='testOneFile')
        self.fsmlFile = fsmlFile
        self.inputFile = inputFile
        self.correctOutputFile = correctOutputFile

    def testOneFile(self):
        self.shortDescription()
        fsm = parseFSM(self.fsmlFile)
        with open(self.inputFile) as inputFile, open(self.correctOutputFile) as outFile:
            correctInputJson = json.load(inputFile)

            # (1) this is the correct output which is created together with the input
            correctJsonOutput = json.load(outFile)

            # (2) this is the output of the Simulator.py module of assignment 2
            simulatedJsonOutput = simulateFSM(fsm, list(correctInputJson))

             # (3) what follows is the output of the dynamically generated TurnstileStepper modules
            generateCode(fsm)  # generate Stepper and Handler
            import TurnstileHandler_generated  # import the newly generated modules (& update their reference)
            reload(TurnstileHandler_generated)
            import TurnstileStepper_generated
            reload(TurnstileStepper_generated)
            stepper = TurnstileStepper_generated.Stepper()
            generatedJsonOutput = stepper.simulateFSM_generated(list(correctInputJson))
            try:
                os.remove('./TurnstileStepper_generated.pyc')
                os.remove('./TurnstileHandler_generated.pyc')
            except OSError:
                pass

            # assert all 3 are equal
            self.assertEqual(correctJsonOutput, simulatedJsonOutput)
            self.assertEqual(correctJsonOutput, generatedJsonOutput)

    def tearDown(self):
        for file in ['./TurnstileStepper_generated.pyc', './TurnstileStepper_generated.py', './TurnstileHandler_generated.pyc', './TurnstileHandler_generated.py']:
            if os.path.exists(file):
                os.remove(file)



    def shortDescription(self):
        return 'Test Case for fsml file : %s with input file : %s and output file : %s' % (self.fsmlFile, self.inputFile, self.correctOutputFile)


def inputTestSuite():
    print "Running positive Input Test Cases"
    fsmlFiles = sorted(glob.glob('./testdata/positive/fsm/*.fsml'))
    inputFiles = sorted(glob.glob('./testdata/positive/input/*.json'))
    correctOutputFiles = sorted(glob.glob('./testdata/positive/output/*.json'))

    return unittest.TestSuite([positiveOutputTestCase(fsmlFile, inputFile, correctOutputFile) for fsmlFile, inputFile, correctOutputFile in zip(fsmlFiles, inputFiles, correctOutputFiles)])

# main module Code for running all the tests

if __name__ == '__main__':

    # remove old templates
    for file in glob.glob('./templates/*'):
        if not ".gitignore" in file:
            os.remove(file)

    if len(sys.argv) > 1:
        depth = int(sys.argv[1])
    else:
        depth = 7 # default value

    testRunner = unittest.TextTestRunner()
    testRunner.run(fsmlTestSuite(depth))
    testRunner.run(inputTestSuite())
