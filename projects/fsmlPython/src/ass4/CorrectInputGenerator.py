from random import randint


def generateCorrectInput(fsm):

    inputlength = randint(1,4*len(fsm))  # maximum input length is set to 4*(number of states)
    currentState = fsm[0]  # that's the initial state
    testInput = []
    correctOutput = []

    for i in range(inputlength):
        if not currentState['transitions']:
            break # the current state has no transitions and therefore the input has to end here
        transition = currentState['transitions'][randint(0,len(currentState['transitions'])-1)]
        nextState = transition['newstate']
        input = transition['input']
        action = transition['action']
        testInput.append(input)

        # also keep track of the correct output
        item = dict()
        item[nextState] = action
        correctOutput.append(item)

        currentState = [state for state in fsm if state['name']==nextState].pop()

    return testInput, correctOutput