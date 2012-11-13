% :- ['Syntax.pro'].
:- ['NameAnalysis.pro'].

test(
"state S1;
state S2; 
state S3;
trans S1 -> S2;
trans S2 -> S1;
trans S2 -> S3;
").

:- (
     test(X),
     fsm(X,[]),
     format('~s',[X]),
     fail
   ;
     halt
   ).
