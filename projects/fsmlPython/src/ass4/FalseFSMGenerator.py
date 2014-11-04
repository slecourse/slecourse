from random import randint
from CorrectFSMGenerator import randomWord


def addDeterminismError(fsm):
    candidates = [state for state in fsm if len(state['transitions']) > 1]
    if not candidates:
        raise ValueError("Can not add a determinism error to given fsm")
    else:
        errorState = candidates[randint(0, len(candidates)-1)]
        indices = range(0, len(errorState['transitions']))
        trans1 = errorState['transitions'][indices.pop(randint(0, len(indices)-1))]
        trans2 = errorState['transitions'][indices.pop(randint(0, len(indices)-1))]
        trans1['input'] = trans2['input']

        return fsm

def addDuplicateIdError(fsm):
    if len(fsm) < 2:
        raise ValueError("Can not add a duplicate ID error to given fsm")
    else:
        indices = range(0, len(fsm))
        state1 = fsm[indices.pop(randint(0, len(indices)-1))]
        state2 = fsm[indices.pop(randint(0, len(indices)-1))]

        state1['name'] = state2['name']

        return fsm

def addReachabilityError(fsm):
    if len(fsm) < 2:
        raise ValueError("Can not add reachability error to given fsm")
    else:
        unreachableState = fsm[randint(1, len(fsm)-1)]
        otherStates = [state['name'] for state in fsm if state is not unreachableState]
        for state in fsm:
            if state is not unreachableState:
                for transition in state['transitions']:
                    if transition['newstate'] == unreachableState['name']:
                        transition['newstate'] = otherStates[randint(0, len(otherStates)-1)]

        return fsm


def addResolutionError(fsm):
    candidates = [state for state in fsm if len(state['transitions']) > 0]
    if not candidates:
        raise ValueError("Can not add resolution error to given fsm")
    else:
        errorState = candidates[randint(0, len(candidates)-1)]
        trans = errorState['transitions'][randint(0, len(errorState['transitions'])-1)]

        unresolvableState = randomWord()
        while unresolvableState in [state['name'] for state in fsm]:
            unresolvableState = randomWord()

        trans['newstate'] = unresolvableState

        return fsm