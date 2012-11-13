fsm --> spaces, states, transs.

states --> [].
states --> state, states.

transs --> [].
transs --> trans, transs.

state
 -->
  "state",
  space,
  spaces,
  id,
  spaces,
  ";",
  spaces.

trans
 -->
  "trans",
  space,
  spaces,
  id,
  spaces,
  "->",
  spaces,
  id,
  spaces,
  ";",
  spaces.

id --> alpha.
id --> alpha, id.

alpha --> [X], { char_type(X, upper) }.
alpha --> [X], { char_type(X, digit) }.

space --> [X], { char_type(X, space) }.
spaces --> [].
spaces --> space, spaces.
