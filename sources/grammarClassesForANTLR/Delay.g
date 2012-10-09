grammar Delay;
options { backtrack = true; k = 1; }
s : 'a' { System.out.println(42); } 'b' 'x' | 'a' 'b' 'y';

// Semantic actions are not prematurely executed.
