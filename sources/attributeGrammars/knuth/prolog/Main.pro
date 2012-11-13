:- ['Syntax.pro'].
:- ['Conversion.pro'].

test("0").
test("1").
test("10").
test("11").
test("100").
test("101").
test("101.01").

:- (
     test(X),
     number(X,[]),
     number(V,X,[]),
     format('~s --> ~w~n',[X, V]),
     fail
   ;
     halt
   ).
