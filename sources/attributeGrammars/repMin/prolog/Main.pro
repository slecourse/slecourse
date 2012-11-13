:- ['RepMin.pro'].

test(bin(leaf(3),bin(leaf(4),leaf(5)))).

:- 
  test(T1),
  format('~w~n',[T1]),
  repMin(T1,T2),
  format('~w~n',[T2]),
  halt.
