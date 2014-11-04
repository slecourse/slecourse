import glob
import json
import os
import sys
import unittest

sys.path.append("../ass2")

from MainFSM import parseFSM
from ConstraintChecker import ok
from FsmExceptions import *
from FalseDataGenerator import generateNegativeTestData
from Simulator import simulateFSM


class parsererrorTestCase(unittest.TestCase):

    def __init__(self, fsmlFile):
        unittest.TestCase.__init__(self, methodName='testOneFile')
        self.fsmlFile = fsmlFile

    def testOneFile(self):
        self.assertRaises(FsmParseException, parseFSM, self.fsmlFile)

    def shortDescription(self):
        return 'TestCase for file %s' % self.fsmlFile

def parsererrorTestSuite(depth):
    print "Running parser error Test Cases"
    # generate new test data
    generateNegativeTestData(depth,'parsererror')

    fsmlFiles = glob.glob('./testdata/negative/fsm/parsererror/*.fsml')
    return unittest.TestSuite([parsererrorTestCase(fsmlFile) for fsmlFile in fsmlFiles])

class infeasibleInputTestCase(unittest.TestCase):

    def __init__(self, fsmlFile, inputFile):
        unittest.TestCase.__init__(self, methodName='testOneFile')
        self.fsmlFile = fsmlFile
        self.inputFile = inputFile

    def testOneFile(self):
        fsm = parseFSM(self.fsmlFile)
        with open(self.inputFile) as inputFile:
            self.assertRaises(InfeasibleSymbolException, simulateFSM, fsm, json.load(inputFile))

    def shortDescription(self):
        return 'TestCase for file %s and input %s' % (self.fsmlFile, self.inputFile)

def infeasibleInputTestSuite(depth):
    print "Running infeasible input Test Cases"
    # generate new test data
    generateNegativeTestData(depth, 'infeasible')

    fsmlFiles = sorted(glob.glob('./testdata/negative/input/infeasible/fsm/*.fsml'))
    inputFiles = sorted(glob.glob('./testdata/negative/input/infeasible/*.json'))
    return unittest.TestSuite([infeasibleInputTestCase(fsmlFile, inputFile) for fsmlFile, inputFile in zip(fsmlFiles, inputFiles)])

class IllegalInputTestCase(unittest.TestCase):

    def __init__(self, fsmlFile, inputFile):
        unittest.TestCase.__init__(self, methodName='testOneFile')
        self.fsmlFile = fsmlFile
        self.inputFile = inputFile

    def testOneFile(self):
        fsm = parseFSM(self.fsmlFile)
        with open(self.inputFile) as inputFile:
            self.assertRaises(IllegalSymbolException, simulateFSM, fsm, json.load(inputFile))

    def shortDescription(self):
        return 'TestCase for file %s and input %s' % (self.fsmlFile, self.inputFile)

def illegalInputTestSuite(depth):
    print "Running illegal input Test Cases"
    # generate new test data
    generateNegativeTestData(depth, 'illegal')

    fsmlFiles = sorted(glob.glob('./testdata/negative/input/illegal/fsm/*.fsml'))
    inputFiles = sorted(glob.glob('./testdata/negative/input/illegal/*.json'))
    return unittest.TestSuite([IllegalInputTestCase(fsmlFile, inputFile) for fsmlFile, inputFile in zip(fsmlFiles, inputFiles)])


class SingleinitialTestCase(unittest.TestCase):

    def __init__(self, fsmlFile):
        unittest.TestCase.__init__(self, methodName='testOneFile')
        self.fsmlFile = fsmlFile

    def testOneFile(self):
        fsm = parseFSM(self.fsmlFile)
        self.assertRaises(SingleInitialException, ok, fsm)

    def shortDescription(self):
        return 'TestCase for file %s' % self.fsmlFile

def singleinitialTestSuite(depth):
    print "Running single initial error Test Cases"
    # generate new test data
    generateNegativeTestData(depth, 'singleinitial')

    fsmlFiles = glob.glob('./testdata/negative/fsm/singleinitial/*.fsml')
    return unittest.TestSuite([SingleinitialTestCase(fsmlFile) for fsmlFile in fsmlFiles])

class DeterminismTestCase(unittest.TestCase):

    def __init__(self, fsmlFile):
        unittest.TestCase.__init__(self, methodName='testOneFile')
        self.fsmlFile = fsmlFile

    def testOneFile(self):
        fsm = parseFSM(self.fsmlFile)
        self.assertRaises(DeterministicException, ok, fsm)

    def shortDescription(self):
        return 'TestCase for file %s' % self.fsmlFile

def determinismTestSuite(depth):
    print "Running determinism error Test Cases"
    # generate new test data
    generateNegativeTestData(depth, 'determinism')

    fsmlFiles = glob.glob('./testdata/negative/fsm/determinism/*.fsml')
    return unittest.TestSuite([DeterminismTestCase(fsmlFile) for fsmlFile in fsmlFiles])


class DuplicateIdTestCase(unittest.TestCase):

    def __init__(self, fsmlFile):
        unittest.TestCase.__init__(self, methodName='testOneFile')
        self.fsmlFile = fsmlFile

    def testOneFile(self):
        fsm = parseFSM(self.fsmlFile)
        self.assertRaises(DistinctIdsException, ok, fsm)

    def shortDescription(self):
        return 'TestCase for file %s' % self.fsmlFile

def duplicateIdTestSuite(depth):
    print "Running duplicate id's error Test Cases"
    # generate new test data
    generateNegativeTestData(depth, 'duplicateids')

    fsmlFiles = glob.glob('./testdata/negative/fsm/duplicateids/*.fsml')
    return unittest.TestSuite([DuplicateIdTestCase(fsmlFile) for fsmlFile in fsmlFiles])


class ReachabilityTestCase(unittest.TestCase):

    def __init__(self, fsmlFile):
        unittest.TestCase.__init__(self, methodName='testOneFile')
        self.fsmlFile = fsmlFile

    def testOneFile(self):
        fsm = parseFSM(self.fsmlFile)
        self.assertRaises(ReachableException, ok, fsm)

    def shortDescription(self):
        return 'TestCase for file %s' % self.fsmlFile

def reachabilityTestSuite(depth):
    print "Running reachability error Test Cases"
    # generate new test data
    generateNegativeTestData(depth, 'reachability')

    fsmlFiles = glob.glob('./testdata/negative/fsm/reachability/*.fsml')
    return unittest.TestSuite([ReachabilityTestCase(fsmlFile) for fsmlFile in fsmlFiles])


class ResolutionTestCase(unittest.TestCase):

    def __init__(self, fsmlFile):
        unittest.TestCase.__init__(self, methodName='testOneFile')
        self.fsmlFile = fsmlFile

    def testOneFile(self):
        fsm = parseFSM(self.fsmlFile)
        self.assertRaises(ResolvableException, ok, fsm)

    def shortDescription(self):
        return 'TestCase for file %s' % self.fsmlFile

def resolutionTestSuite(depth):
    print "Running resolution error Test Cases"
    # generate new test data
    generateNegativeTestData(depth, 'resolution')

    fsmlFiles = glob.glob('./testdata/negative/fsm/resolution/*.fsml')
    return unittest.TestSuite([ResolutionTestCase(fsmlFile) for fsmlFile in fsmlFiles])


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
    testRunner.run(parsererrorTestSuite(depth))
    testRunner.run(infeasibleInputTestSuite(depth))
    testRunner.run(illegalInputTestSuite(depth))
    testRunner.run(singleinitialTestSuite(depth))
    testRunner.run(determinismTestSuite(depth))
    testRunner.run(duplicateIdTestSuite(depth))
    testRunner.run(resolutionTestSuite(depth))
    testRunner.run(reachabilityTestSuite(depth))

