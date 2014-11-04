from random import randint
import string


def randomWord():
    wordlength = randint(2,10)
    word = ""
    for i in range(wordlength):
        word += string.ascii_lowercase[randint(0,25)]
    return word

def randomInputName(state, allInputNames):
    stateInputNames = set([trans["input"] for trans in state["transitions"]])
    remainingInputNames = set(allInputNames).difference(stateInputNames)
    if not remainingInputNames:
        newlabel = randomWord()
        # this while loop just makes sure that no random duplicates are created by accident
        while newlabel in allInputNames:
            newlabel = randomWord()
        allInputNames.append(newlabel)
        return newlabel
    else:
        return list(remainingInputNames)[randint(0,len(remainingInputNames)-1)]

def sortFSM(fsm, transitionList):
    # put initial state at head of the list
    sortedFsm = [fsm.pop(0)]

    # now append dicts of all other states to list
    for transCount in transitionList[1:]:
        fittingState = [state for state in fsm if len(state["transitions"])==transCount].pop()
        fsm.remove(fittingState)
        sortedFsm.append(fittingState)

    return sortedFsm


def createSpecificFSM(transitionList):

    fsm = []

    noOfStates = len(transitionList)
    noOfTrans = sum(transitionList)

    if (noOfTrans < noOfStates-1) or (transitionList[0] == 0 and len(transitionList) > 1):
        raise ValueError("Can not construct a valid FSM with given input")


    stateNames = [randomWord() for i in range(noOfStates)]
    # this while loop is only run if the random word generator accidently generates duplicate words
    while len(set(stateNames)) < len(stateNames):
        stateNames = [randomWord() for i in range(noOfStates)]

    inputNames = []
    stateDicts = []

    for requiredTrans, stateName in zip([transitionList[0]]+sorted(transitionList[1:], reverse=True), stateNames):
        state = dict()
        state["transitions"] = []
        state["name"] = stateName
        state["requiredTransitions"] = requiredTrans
        stateDicts.append(state)

    # add the initial state
    fsm.append(stateDicts.pop(0))
    noOfStates -= 1

    for i in range(noOfTrans):
        stillNeedTrans = [state for state in fsm if state["requiredTransitions"]>0]
        randomStartState = stillNeedTrans[randint(0, len(stillNeedTrans)-1)]
        if i < noOfStates:
            randomTargetState = stateDicts.pop(0)
            fsm.append(randomTargetState)
        else:
            randomTargetState = fsm[randint(0, len(fsm)-1)]
        inputName = randomInputName(randomStartState, inputNames)
        randomStartState["transitions"].append({'input': inputName, 'action': randomWord(), 'newstate': randomTargetState['name']})
        randomStartState["requiredTransitions"] -= 1

    return sortFSM(fsm, transitionList)
