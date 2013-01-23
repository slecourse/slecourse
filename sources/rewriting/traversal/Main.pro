:- ['Rules.pro'].
:- ['Strategies.pro'].

test(num(1)+num(41)).
test((num(11)+num(9))*(num(2)+num(4))).

:- 
     test(X),
     normalize(X,Y),
     format('~w -> ~w~n',[X,Y]),
     fail
   ; 
     halt.
