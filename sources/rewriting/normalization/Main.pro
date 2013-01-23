:- ['Syntax.pro'].
:- ['Rules.pro'].
:- ['Strategies.pro'].

test(add(succ(succ(zero)),succ(zero))).
test(add(add(succ(succ(zero)),zero),add(zero,succ(zero)))).

:- 
     test(X),
     normalize(X,Y),
     format('~w -> ~w~n',[X,Y]),
     fail
   ; 
     halt.
