grammar LL2;
options { k = 2; }
s : 'a' 'x' | 'a' 'y';

// Ok! This grammar is LL(2).
