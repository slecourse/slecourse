grammar BNF;

options {
  k = 2;
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

number 		: bits rest EOF;
bits 		: bit | bit bits;
bit 		: '0' | '1';
rest 		: | '.' bits;
