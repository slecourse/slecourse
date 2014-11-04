import os
from nltk.parse.generate import generate
from nltk.grammar import CFG

grammarstring = """
FSM -> 'initial' 'state' '#initState#' '{' TRANS '}' STATES
STATES -> STATE STATES |
STATE -> 'state' '#stateDecl#' '{' TRANS '}'
TRANS -> '#input#' '/' '#action#' '->' '#newState#' ';' TRANS |
"""

def generateRawTemplates(depth):
    gram = CFG.fromstring(grammarstring)
    rawTemplates = generate(gram, depth=depth)
    templatefiles = []

    for index, state in enumerate(rawTemplates):
        filename = os.path.join("./templates","template"+str(index))
        with open(filename, 'w') as templatefile:
            templatefile.write(' '.join(state))
            templatefiles.append(filename)

    print str(len(templatefiles))+" template files generated"

    return templatefiles
