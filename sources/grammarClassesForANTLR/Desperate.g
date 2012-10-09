grammar Desperate;
options { backtrack = true; }
s : p 'x' | p 'y';
p : 'a' p 'b' | ;

// Ok! LL(*) not applicable but backtracking works.
