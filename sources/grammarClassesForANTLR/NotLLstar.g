grammar NotLLstar;
s : p 'x' | p 'y';
p : 'a' p 'b' | ;

// Error! LL(*) not applicable.
