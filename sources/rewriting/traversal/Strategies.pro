normalize(X,Z)
 :-
    rewrite(X,Y),
    normalize(Y,Z).
normalize(X,X)
 :-
    \+ rewrite(X,_).
