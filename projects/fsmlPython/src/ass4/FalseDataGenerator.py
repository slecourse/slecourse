import json
import os
from random import randint
from jinja2 import FileSystemLoader, Environment
from FalseFSMGenerator import addDeterminismError, addDuplicateIdError, addReachabilityError, addResolutionError
from SyntaxGenerator import generateRawTemplates
from FalseInputGenerator import generateInfeasibleInput, generateIllegalInput
from CorrectFSMGenerator import createSpecificFSM


def generateJinjaTemplateFile(filename, error):
    templatefile = open(filename, 'r')
    content = templatefile.read().split()
    noStates = 0
    currentState = None
    currentTransition = None
    transList = []
    syntaxErrorPos = 0 # default case no error is produced
    initialErrorPos = 0 # default case no error is produced

    if error=='parsererror':
        if not "#stateDecl#" in content or not "#input#" in content:
            syntaxErrorPos = randint(1,3)  # no matter how small the fsm is, it is always possible to insert a parser error at these positions
        else:
            syntaxErrorPos = randint(1,7)  # if the fsm has any transitions, there are more possibilities to insert a parser error
    elif error=='singleinitial':
        noOfStates = len([state for state in content if state=='#stateDecl#'])
        initialErrorPos = randint(1, noOfStates+1)

    for index, token in enumerate(content):

        if "initial" in token:
            if syntaxErrorPos == 1:
                content[index] = "initail"
            elif initialErrorPos == 1:
                initialErrorPos = 0
                content.remove('initial')  # remove initial keyword -> 0 initial states

        if syntaxErrorPos==2 and "state" in token:
            content[index] = "states"

        if "#initState#" in token:
            content[index] = "{{ states[0].name }} {" if syntaxErrorPos==3 else "{{ states[0].name }}"
            currentState = 0
            currentTransition = -1
            transList.insert(0,0)

        if "#stateDecl#" in token:
            noStates += 1
            currentState = noStates
            if syntaxErrorPos==4:
                content[index] = "{{ states[" + str(currentState) + "].name }} ]"
            elif initialErrorPos == noStates+1:
                content[index-1] = 'initial state'
                content[index] = "{{ states[" + str(currentState) + "].name }}"
            else:
                content[index] = "{{ states[" + str(currentState) + "].name }}"
            currentTransition = -1
            transList.append(0)

        if "#input#" in token:
            currentTransition += 1
            transList[currentState]=currentTransition+1
            content[index] = "{{ states[" + str(currentState) + "].transitions[" + str(currentTransition) + "].input }} X" if syntaxErrorPos==5 else "{{ states[" + str(currentState) + "].transitions[" + str(currentTransition) + "].input }}"

        if "#action#" in token:
            content[index] = "/ {{ states[" + str(currentState) + "].transitions[" + str(currentTransition) + "].action }}" if syntaxErrorPos==6 else "{{ states[" + str(currentState) + "].transitions[" + str(currentTransition) + "].action }}"

        if "#newState#" in token:
            content[index] = "_ {{ states[" + str(currentState) + "].transitions[" + str(currentTransition) + "].newstate }}" if syntaxErrorPos==7 else "{{ states[" + str(currentState) + "].transitions[" + str(currentTransition) + "].newstate }}"


    templatefile.close()
    templatefile = open(filename, 'w')
    templatefile.write(' '.join(content))
    templatefile.close()

    return transList


def removeOldNegativeTestFiles(error):
    if error=='infeasible' or error=='illegal':
        subdir = 'input'
    else:
        subdir = 'fsm'
    for path, _, files in os.walk(os.path.join("./testdata/negative/", subdir, error)):
        for testfile in files:
            if not testfile == ".gitignore":
                os.remove(os.path.join(path, testfile))


def generateNegativeTestData(depth, error):

    removeOldNegativeTestFiles(error)  # remove old testfiles for given error

    templatefiles = generateRawTemplates(depth)
    env = Environment(loader=FileSystemLoader('.'))
    count = 0

    for file in templatefiles:
        # after this command, the placeholders of the file are replaced with jinja placeholders
        transList = generateJinjaTemplateFile(file, error)
        fsmlFilePath = os.path.join("./testdata/negative/fsm", error, "sample"+file.split("template")[2]+".fsml")

        try:
            fsm = createSpecificFSM(transList)

            # generate wrong .fsml File
            if error=='determinism':
                fsm = addDeterminismError(fsm)

            if error=='duplicateids':
                fsm = addDuplicateIdError(fsm)

            if error=='reachability':
                fsm = addReachabilityError(fsm)

            if error=='resolution':
                fsm = addResolutionError(fsm)

            if error=='infeasible' or error=='illegal':
                fsmlFilePath = os.path.join("./testdata/negative/input", error, "fsm", "sample"+file.split("template")[2]+".fsml")

                if error=='infeasible':
                    wrongInput = generateInfeasibleInput(fsm)
                else:
                    wrongInput = generateIllegalInput(fsm)

                inputFile = open(os.path.join("./testdata/negative/input", error, "input"+file.split("template")[2]+".json"), 'w')
                inputFile.write(json.dumps(wrongInput))
                inputFile.close()


            fsmlFile = open(fsmlFilePath, 'w')
            template = env.get_template(file)
            fsmlData = template.render(states=fsm)
            fsmlFile.write(fsmlData)
            fsmlFile.close()

            count += 1

        except ValueError:
            os.remove(file)

    print str(count)+" test-data files generated"
