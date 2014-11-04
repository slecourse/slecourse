from random import randint
from CorrectInputGenerator import generateCorrectInput
from CorrectFSMGenerator import randomWord

def generateIllegalInput(fsm):

    correctInput, _ = generateCorrectInput(fsm)
    errorPosition = randint(0, len(correctInput)-1)

    feasibleInputs = []
    for state in fsm:
        feasibleInputs += [transition['input'] for transition in state['transitions']]

    wrongInput = randomWord()
    while wrongInput in feasibleInputs:
        wrongInput = randomWord()

    correctInput[errorPosition] = wrongInput

    return correctInput


def generateInfeasibleInput(fsm):

    feasibleInputs = []
    for state in fsm:
        feasibleInputs += [transition['input'] for transition in state['transitions']]

    initialState = fsm[0]
    candidates = dict()

    findInfeasibleCandidates(initialState, set(feasibleInputs), fsm, [], candidates, [])
    if candidates:
        randomCandidate = candidates.keys()[randint(0, len(candidates)-1)]
        return candidates[randomCandidate]
    else:
        raise ValueError("Infeasible Input could not be constructed")


def findInfeasibleCandidates(currentState, feasibleInputs, fsm, path, candidates, visitedStates):

    visitedStates.append(currentState)
    ownInputs = set([transition['input'] for transition in currentState['transitions']])
    infeasibleInputs = feasibleInputs.difference(ownInputs)

    if infeasibleInputs:
        candidatePath = list(path)
        candidatePath.append(list(infeasibleInputs)[randint(0, len(infeasibleInputs)-1)])
        candidates[currentState['name']] = candidatePath

    for transition in currentState["transitions"]:
        targetState = [state for state in fsm if state['name']==transition['newstate']].pop()
        if not targetState in visitedStates:
            newPath = list(path)
            newPath.append(transition['input'])
            findInfeasibleCandidates(targetState, feasibleInputs, fsm, newPath, candidates, visitedStates)
