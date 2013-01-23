normalize(X,X)
 :- 
    normalform(X).

normalize(X,Z)
 :- 
    once(step(X,Y)), 
    normalize(Y,Z).

step(X,Y)
 :-
    rule(X,Y).

step(X,Y)
 :-
    X =.. [F|XL],
    append(Prefix,[XE|Postfix],XL),
    step(XE,YE),
    append(Prefix,[YE|Postfix],YL),
    Y =.. [F|YL].
