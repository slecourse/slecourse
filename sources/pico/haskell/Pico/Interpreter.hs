module Pico.Interpreter where

import Prelude hiding (lookup)
import Pico.AbstractSyntax
import Data.Map (Map, empty, lookup, alter)

-- Expression values
data Value
 = IntValue Int
 | StrValue String
     deriving (Eq, Show, Read) 

-- Variables stores
type Store = Map Name Value


execProgram :: Program -> Maybe Store
execProgram (_, ss) = execStms ss empty

execStms :: [Stm] -> Store -> Maybe Store
execStms [] st = Just st
execStms (s:ss) st = execStm s st >>= execStms ss

execStm :: Stm -> Store -> Maybe Store
execStm s st
 = case s of
     Assign n e -> do
       v <- evalExpr e st
       return (alter (const (Just v)) n st)
     IfStm c ss1 ss2 -> do
       v <- evalExpr c st
       case v of
         (IntValue i) ->
           if i/=0 
             then execStms ss1 st
             else execStms ss2 st
         _ -> Nothing
     While c ss -> do
       v <- evalExpr c st
       case v of
         (IntValue i) ->
           if i/=0 
             then execStms (ss++[s]) st
             else Just st
         _ -> Nothing
        
evalExpr :: Expr -> Store -> Maybe Value
evalExpr e st
 = case e of 
     Id n -> lookup n st
     NatCon i -> Just (IntValue i)
     StrCon s -> Just (StrValue s)
     Add e1 e2 -> do
       v1 <- evalExpr e1 st
       v2 <- evalExpr e2 st
       case (v1, v2) of 
         (IntValue i1, IntValue i2) -> Just (IntValue (i1+i2))
         _ -> Nothing
     Sub e1 e2 -> do
       v1 <- evalExpr e1 st
       v2 <- evalExpr e2 st
       case (v1, v2) of 
         (IntValue i1, IntValue i2) -> Just (IntValue (i1-i2))
         _ -> Nothing
     Conc e1 e2 -> do
       v1 <- evalExpr e1 st
       v2 <- evalExpr e2 st
       case (v1, v2) of 
         (StrValue s1, StrValue s2) -> Just (StrValue (s1++s2))
         _ -> Nothing
