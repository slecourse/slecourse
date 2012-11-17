grammar Acceptor;

options {
  k = 1;
}

@members {

// Throw if any error was emitted
private boolean error = false;

public boolean getError() { return error; }

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
 ';'; 
 
trans :
 'trans'
 ID
 '->'
 ID
 ';'; 

ID   :   ('A'..'Z'|'0'..'9')+;
WS   :   (' '|'\r'? '\n'|'\t')+ { skip(); };
