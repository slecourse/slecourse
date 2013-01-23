% Always succeed and preserve term
id(X,X).

% Try S but succeed anyway
try(S,X,Y) :- 
  choice(S,id,X,Y).

% Sequentially compose S1 and S2
seq(S1,S2,X,Z) :-
  apply(S1,[X,Y]),
  apply(S2,[Y,Z]).

% Try S1; if it fails, try S2
choice(S1,S2,X,Y) :- 
  apply(S1,[X,Y]) ->
      true
    ; apply(S2,[X,Y]).

vary(S1,S2,X,Y) :-
  choice(S2,seq(S1,S2),X,Y).

% Apply S exhaustively
repeat(S,X,Y) :- 
  try(seq(S,repeat(S)),X,Y).

% Apply S once in bottom-up order
oncebu(S,X,Y) :-
  choice(one(oncebu(S)),S,X,Y).

% Apply S to one immediate subterm successfully 
one(S,X,Y) :-
  X =.. [F|LX],
  append(Prefix,[EX|Postfix],LX),
  apply(S,[EX,EY]),
  !,
  append(Prefix,[EY|Postfix],LY),
  Y =.. [F|LY].

% Repeat oncebu exhaustively
innermost(S,X,Y) :- 
  repeat(oncebu(S),X,Y).

all(S,X,Y) :-
  X =.. [F|LX],
  maplist(S,LX,LY),
  Y =.. [F|LY].

fulltd(S,X,Y) :- seq(S,all(fulltd(S)),X,Y).
