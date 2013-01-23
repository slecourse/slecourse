:- ['Rules.pro'].
:- ['Strategies.pro'].

test(a*0+b).

test(try(simplify),X) :- test(X).
test(repeat(simplify),X) :- test(X).
test(oncebu(simplify),X) :- test(X).
test(fulltd(try(simplify)),X) :- test(X).
test(fulltd(try(vary(commute,simplify))),X) :- test(X).
test(innermost(simplify),X) :- test(X).
test(innermost(vary(commute,simplify)),X) :- test(X).

:-
     test(S,X),
     apply(S,[X,Y]),
     format('~w: ~w -> ~w~n', [S,X,Y]),
     fail
   ; 
     halt.
