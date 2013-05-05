{- 

The machine maintains an instruction pointer into an instruction list,
a memory, and an operand stack. Most instructions pass control to the
next instruction. There are jump constructions, though. The memory
maintains the address for the next declared variable, much like a heap
in runtime systems.  

-}

module Pico.Machine where

import Pico.AssemblerCode

-- Values are either ints or strings
type Value = Either Int String

-- Memory for variables
data Memory = Memory {
    getNext  :: Int, -- Next cell to allocate
    getCell  :: [(Name,Int)], -- Memory cells for variables
    getValue :: [(Int,Value)] -- Actual memory
  }
  deriving (Show)

-- The initial memory
initialMemory :: Memory
initialMemory = Memory { 
    getNext = 0,
    getCell = [],
    getValue = []
  } 

-- Declare a variable
declare :: Name -> Memory -> Memory
declare n m = m {
    getNext = getNext m + 1,
    getCell = modify n (getNext m) (getCell m)
  }

-- Reference a variable
lvalue :: Name -> Memory -> Maybe Value
lvalue n m = maybe Nothing (Just . Left) (lookup n (getCell m))

-- Dereference a variable
rvalue :: Name -> Memory -> Maybe Value
rvalue n m = maybe Nothing (\c -> lookup c (getValue m)) (lookup n (getCell m))

-- Assign a value to a variable
assign :: Int -> Value -> Memory -> Memory
assign l r m = m {
    getValue = modify l r (getValue m) 
  }

-- Operand stack
type Stack = [Value]

-- Find labeled instruction
find :: [Instr] -> Label -> Maybe Int
find p l = find' 0 p
  where
    find' i (Label l':_) | l==l' = Just i
    find' _ [] = Nothing
    find' i p' = find' (i+1) (tail p')

-- Interpretation of instruction sequences
run :: [Instr] -> Maybe Memory
run p = run' 0 initialMemory []
  where
    run' i m s = 
      if i >= length p
        then Just m
        else maybe
               Nothing
               (\(i', m', s') -> run' i' m' s') 
               (step p i m s)

-- Interpretation of instructions
step :: [Instr]  -- The complete instruction sequence
    -> Int      -- The instruction pointer (before)
    -> Memory   -- The memory (before)
    -> Stack    -- The stack (before)
    -> Maybe (
        Int,    -- The instruction pointer (after)
        Memory, -- The memory (after)
        Stack   -- The stack (after)
       )

step p i m s = step' (p!!i)
  where
    step' (DclInt n) = Just (i+1, declare n m, s)
    step' (DclStr n) = Just (i+1, declare n m, s)
    step' (PushNat v) = Just (i+1, m, Left v : s)
    step' (PushStr v) = Just (i+1, m, Right v : s)
    step' (Rvalue n) = maybe Nothing (\v -> Just (i+1, m, v : s)) (rvalue n m)
    step' (Lvalue n) = maybe Nothing (\v -> Just (i+1, m, v : s)) (lvalue n m)
    step' AssignOp =
      case s of
        (r : Left l : s') -> Just (i+1, assign l r m, s')
        _ -> Nothing
    step' AddOp =
      case s of
        (Left x : Left y : s') -> Just (i+1, m, Left (y+x) : s')
        _ -> Nothing
    step' SubOp =
      case s of
        (Left x : Left y : s') -> Just (i+1, m, Left (y-x) : s')
        _ -> Nothing
    step' ConcOp =
      case s of
        (Right x : Right y : s') -> Just (i+1, m, Right (y++x) : s')
        _ -> Nothing
    step' (Label _) = Just (i+1, m, s)
    step' (Go l) = maybe Nothing (\i' -> Just (i', m, s)) (find p l)
    step' (GoZero l) =
      case s of
        (Left x : s') ->
          if x == 0 
            then step' (Go l)
            else Just (i+1, m, s)
        _ -> Nothing
    step' (GoNonZero l) =
      case s of
        (Left x : s') ->
          if not (x == 0) 
            then step' (Go l)
            else Just (i+1, m, s)
        _ -> Nothing

-- The modify counterpart to lookup
modify :: Eq x => x -> y -> [(x,y)] -> [(x,y)]
modify x y [] = [(x,y)]
modify x y ((x',y'):r) = 
  if x==x'
    then (x',y) : r 
    else (x',y') : modify x y r 
