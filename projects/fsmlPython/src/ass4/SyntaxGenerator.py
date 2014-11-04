import os
from nltk.parse.generate2 import generate
from nltk.grammar import parse_cfg

grammarstring = """
FSM -> 'initial' 'state' '#initState#' '{' TRANS '}' STATES
STATES -> STATE STATES |
STATE -> 'state' '#stateDecl#' '{' TRANS '}'
TRANS -> '#input#' '/' '#action#' '->' '#newState#' ';' TRANS |
"""

def generateRawTemplates(depth):
    gram = parse_cfg(grammarstring)
    rawTemplates = generate(gram, depth=depth)
    templatefiles = []

    for index, state in enumerate(rawTemplates):
        filename = os.path.join("./templates","template"+str(index))
        with open(filename, 'w') as templatefile:
            templatefile.write(' '.join(state))
            templatefiles.append(filename)

    print str(len(rawTemplates))+" template files generated"

    return templatefiles
