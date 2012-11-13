fsm
 -->
  spaces, states([], SS), transs(SS).

states(SS, SS) --> [].
states(SS1, SS2)
 -->
  state(S),
  { \+ member(S, SS1) },
  states([S|SS1], SS2).

transs(_SS) --> [].
transs(SS) --> trans(SS), transs(SS).

state(S)
 -->
  "state",
  space,
  spaces,
  id(S),
  spaces,
  ";",
  spaces.

trans(SS)
 -->
  "trans",
  space,
  spaces,
  id(S1),
  { member(S1, SS) },
  spaces,
  "->",
  spaces,
  id(S2),
  { member(S2, SS) },
  spaces,
  ";",
  spaces.

id([X]) --> alpha(X).
id([X|R]) --> alpha(X), id(R).

alpha(X) --> [X], { char_type(X, upper) }.
alpha(X) --> [X], { char_type(X, digit) }.

space --> [X], { char_type(X, space) }.
spaces --> [].
spaces --> space, spaces.
