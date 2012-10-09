grammar SynPreds;
s : (p 'x') => p 'x' 
  | (p 'y') => p 'y';
p : 'a' p 'b' | ;

// Ok! We make the choice based on syntactic predicates.
