grammar NameAnalysis;

options {
  k = 1;
}

@members {

// Throw if any error was emitted
private boolean error = false;

public boolean getError() { return error; }

// Maintain FSM as instance variable
private Fsm fsm = new Fsm();

public Fsm getFsm() { return fsm; }

@Override
public void emitErrorMessage(String msg) 
{
  error = true;
  super.emitErrorMessage(msg);
}
}

fsm : state* trans* EOF;

state :
 'state'
 ID
 { fsm.addState($ID.text); }
 ';'; 
 
trans :
 'trans'
 from=ID
 '->'
 to=ID
 { fsm.addTrans($from.text, $to.text); }
 ';'; 

ID   :   ('A'..'Z'|'0'..'9')+;
WS   :   (' '|'\r'? '\n'|'\t')+ { skip(); };
