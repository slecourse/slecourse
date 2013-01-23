rewrite(num(X)+num(Y),num(Z)) :- Z is X + Y.
rewrite(num(X)*num(Y),num(Z)) :- Z is X * Y.
rewrite(X*(Y+Z),X*Y+X*Z).
rewrite(X+Y,Z+Y) :- rewrite(X,Z).
rewrite(X+Y,X+Z) :- rewrite(Y,Z).
rewrite(X*Y,Z*Y) :- rewrite(X,Z).
rewrite(X*Y,X*Z) :- rewrite(Y,Z).
