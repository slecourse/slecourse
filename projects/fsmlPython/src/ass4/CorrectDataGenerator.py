import glob
import json
import os
from jinja2 import FileSystemLoader, Environment
from CorrectFSMGenerator import createSpecificFSM
from CorrectInputGenerator import generateCorrectInput
from SyntaxGenerator import generateRawTemplates


def generateJinjaTemplateFile(filename):
    templatefile = open(filename, 'r')
    content = templatefile.read().split()
    noStates = 0
    currentState = None
    currentTransition = None
    transList = []

    for index, token in enumerate(content):
        if "#initState#" in token:
            content[index] = "{{ states[0].name }}"
            currentState = 0
            currentTransition = -1
            transList.insert(0,0)

        if "#stateDecl#" in token:
            noStates += 1
            currentState = noStates
            content[index] = "{{ states[" + str(currentState) + "].name }}"
            currentTransition = -1
            transList.append(0)

        if "#input#" in token:
            currentTransition += 1
            transList[currentState]=currentTransition+1
            content[index] = "{{ states[" + str(currentState) + "].transitions[" + str(currentTransition) + "].input }}"

        if "#action#" in token:
            content[index] = "{{ states[" + str(currentState) + "].transitions[" + str(currentTransition) + "].action }}"

        if "#newState#" in token:
            content[index] = "{{ states[" + str(currentState) + "].transitions[" + str(currentTransition) + "].newstate }}"
    templatefile.close()
    templatefile = open(filename, 'w')
    templatefile.write(' '.join(content))
    templatefile.close()

    return transList


def removeOldCorrectTestFiles(subdir=''):
    for path, _, files in os.walk(os.path.join("./testdata/positive", subdir)):
        for testfile in files:
            if not testfile == ".gitignore":
                os.remove(os.path.join(path, testfile))


def generatePositiveTestData(depth):

    removeOldCorrectTestFiles()

    templatefiles = generateRawTemplates(depth)
    env = Environment(loader=FileSystemLoader('.'))
    count = 0

    for file in templatefiles:
        # after this command, the placeholders of the file are replaced with jinja placeholders
        transList = generateJinjaTemplateFile(file)

        try:
            # generate correct .fsml File
            fsm = createSpecificFSM(transList)
            template = env.get_template(file)
            fsmlData = template.render(states=fsm)
            fsmlFile = open(os.path.join("./testdata/positive/fsm", "sample"+file.split("template")[2]+".fsml"), 'w')
            fsmlFile.write(fsmlData)
            fsmlFile.close()

            # generate correct input .json File
            correctInput, correctOutput = generateCorrectInput(fsm)
            inputFile = open("./testdata/positive/input/input"+file.split("template")[2]+".json", 'w')
            inputFile.write(json.dumps(correctInput))
            inputFile.close()
            outputFile = open("./testdata/positive/output/output"+file.split("template")[2]+".json", 'w')
            outputFile.write(json.dumps(correctOutput))
            outputFile.close()

            count += 1

        except ValueError:
            os.remove(file)

    print str(count)+" test-data files generated"
