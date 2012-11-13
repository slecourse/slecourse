module Syntax where

type FSM = ([State], [Transition])
type State = String
type Transition =  (State, State)

