rule(add(zero,X),X).
rule(add(succ(X),Y),succ(add(X,Y))).
rule(mult(zero,_),zero).
rule(mult(succ(X),Y),add(Y,mult(X,Y))).
