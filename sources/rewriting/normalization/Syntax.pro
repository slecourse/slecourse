term(zero).
term(succ(X)) :- term(X).
term(add(X,Y)) :- term(X), term(Y).
term(mult(X,Y)) :- term(X), term(Y).

normalform(zero).
normalform(succ(X)) :- normalform(X).
