import os
from jinja2 import Environment, FileSystemLoader


def generateCode(fsm):

    with open("./TurnstileHandler_generated.py","w") as handlerFile, open("./TurnstileStepper_generated.py","w") as stepperFile:

        actions = set()
        transitions = []

        for fromState, [stateDeclaration] in fsm.iteritems():
            if stateDeclaration["initial"]:
                initialState = fromState
            for input, [(action, toState)] in stateDeclaration["transitions"].iteritems():
                actions.add(action)
                transitions.insert(0,(fromState, input, action, toState))

        env = Environment(loader=FileSystemLoader(os.path.join(os.path.dirname(__file__),"templates")))
        handlerTemplate = env.get_template('handler_template')
        stepperTemplate = env.get_template('stepper_template')

        handlerClass = handlerTemplate.render(actions=actions)
        stepperClass = stepperTemplate.render(initialState=initialState, transitions=transitions)

        handlerFile.write(handlerClass)
        stepperFile.write(stepperClass)