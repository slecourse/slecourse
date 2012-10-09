grammar NotLL1;
options { k = 1; }
s : 'a' 'x' | 'a' 'y';

// Error! This grammar is not LL(1).
