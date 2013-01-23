simplify(X+0,X).
simplify(X*1,X).
simplify(_*0,0).
simplify(X*Y+X*Z,X*(Y+Z)).

commute(X+Y,Y+X).
commute(X*Y,Y*X).

associate((X*Y)*Z,X*(Y*Z)).
associate((X+Y)+Z,X+(Y+Z)).
