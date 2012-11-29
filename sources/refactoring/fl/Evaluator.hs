module Evaluator where

import Prelude hiding (lookup)
import Data.Map
import AbstractSyntax

eval :: [Function] -> Expr -> Maybe Int
eval fs e = eval empty e
  where
    eval :: Map Name Int -> Expr -> Maybe Int
    eval m (Literal i) = Just i
    eval m (Argument n) = lookup n m
    eval m (Binary o x y) = do 
    	     x' <- eval m x
	     y' <- eval m y
             return (case o of
               Equal -> if x'==y' then -1 else 0
               Plus -> x' + y'
               Minus -> x' - y') 
    eval m (IfThenElse x y z) = do 
    	     x' <- eval m x
	     if x' /= 0 then eval m y else eval m z
    eval m (Apply n es) = do
    	     is <- mapM (eval m) es
    	     (ns,e) <- lookupFunction
	     let m' = fromList (zip ns is)
	     eval m' e
     where
      lookupFunction :: Maybe ([Name], Expr)
      lookupFunction
        = head ( [ Just (ns,e) |
                   (Function n' ns e) <- fs,
                   n == n' ] ++ [Nothing] )
    eval m (Let n x y) = do
    	     x' <- eval m x
             let m' = insert n x' m
             eval m' y
