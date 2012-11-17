grammar EBNF;

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

number 		: bit+ ('.' bit+)? EOF;
bit 		: '0' | '1';
