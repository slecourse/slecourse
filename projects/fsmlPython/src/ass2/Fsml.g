grammar Fsml;

options {
	language=Python;
}

@header {
    import antlr3
    from collections import defaultdict
    from FsmExceptions import *
}

@init {
    self.fsmObject = defaultdict(list)
    self.stateObject = dict()
    self.currentState = ""
}

@members {

    def addState(self, initialText, idText):
        self.stateObject = dict()
        self.stateObject['transitions'] = defaultdict(list)
        self.stateObject['initial'] = (initialText=='initial')
        self.fsmObject[idText] += [self.stateObject]
        self.currentState = idText


    def addTransition(self, inputText, actionText, targetStateText):
        self.stateObject['transitions'][inputText] += [("" if str(actionText) == "None" else actionText, self.currentState if str(targetStateText) == "None" else targetStateText)]

    def displayRecognitionError(self, tokenNames, e):
        raise FsmParseException()

    antlr3.BaseRecognizer.displayRecognitionError = displayRecognitionError

}

fsm          : state* EOF ;
state        : initial? 'state' id {self.addState($initial.text,$id.text)} '{' transition* '}' ;
initial      : 'initial' ;
transition   : input_ ('/' action )? ( '->' id )? ';' {self.addTransition($input_.text, $action.text, $id.text)} ;
id           : NAME ;
input_       : NAME ;
action       : NAME ;
NAME         : ('a'..'z'|'A'..'Z')+ ;
WS           : ( '\t' | ' ' | '\r' | '\n'| '\u000C' )+    { self.skip() } ;
