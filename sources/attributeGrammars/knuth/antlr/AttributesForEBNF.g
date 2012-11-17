grammar AttributesForEBNF;

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

number returns [float val] :
 	{ $val = 0; } 
	( bit1=bit { $val = $val*2 + $bit1.val; } )+ 
	('.' { float place = 0.5f; } ( bit2=bit { $val += $bit2.val*place; place /= 2; } )+)? 
	EOF;

bit returns [float val] : 
		( '0' { $val = 0; } )
	| 	( '1' { $val = 1; } )
	;
