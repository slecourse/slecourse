grammar Factoring;
options { k = 1; }
s : p ('x' | 'y');
p : 'a' p 'b' | ;

// Ok! Perfectly factored.

