grammar Backtracking;
options { backtrack = true; k = 1; }
s : 'a' 'x' | 'a' 'y';

// Ok! This grammar is not LL(1) but backtracking works.
