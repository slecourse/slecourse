grammar LL1;
options { k = 1; }
s : 'a' 'x' | 'b' 'x' ;

// Ok! This grammar is LL(1).

WS : (' '|'\r'? '\n'|'\t')+ {skip();};
