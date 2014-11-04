from FsmExceptions import IllegalSymbolException, InfeasibleSymbolException

def simulateFSM(fsm, inputList):

    output = []
    feasibleInputs = set()

    # getting the initial state and computing feasible Inputs
    for stateName, [stateDeclaration] in fsm.iteritems():
        if stateDeclaration["initial"]:
            currentState = stateDeclaration
        for input, _ in stateDeclaration["transitions"].iteritems():
            feasibleInputs.add(input)

    # processing the input
    while inputList:
        input = inputList.pop(0)
        if input not in currentState["transitions"] and input not in feasibleInputs:
            raise IllegalSymbolException
        elif input not in currentState["transitions"]:
            raise InfeasibleSymbolException
        else:
            [(action, targetState)] = currentState["transitions"][input]
            item = dict()
            item[targetState] = action
            output.append(item)
            [currentState] = fsm[targetState]

    return output