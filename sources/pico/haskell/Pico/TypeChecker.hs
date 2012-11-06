module Pico.TypeChecker where

import Prelude hiding (lookup)
import Pico.AbstractSyntax
import Data.Map (Map, toList, fromListWith, lookup)

-- Error messages
type Error = (
  String, -- Message
  String  -- Syntactical phrase
 ) 

-- Type environments
type Env = Map Name Type


typeCheckProgram :: Program -> [Error]
typeCheckProgram (ds, ss)
 = typeCheckDecls ds ++ typeCheckStms env ss
 where
  env = fromListWith (const id) ds

typeCheckDecls :: [Decl] -> [Error]
typeCheckDecls ds
 = map (\n -> ("double declaration", n)) doubles
 where
  doubles = map fst (filter ((>1) . snd) counts)
  counts = toList (fromListWith (+) [ (fst d,1) | d <- ds ])

typeCheckStms :: Env -> [Stm] -> [Error]
typeCheckStms env ss = concat (map (typeCheckStm env) ss)

typeCheckStm :: Env -> Stm -> [Error]
typeCheckStm env s
 = case s of
     Assign n e ->
       maybe
         [("undeclared variable", n)]
         (typeCheckExpr env e)
         (lookup n env)
     IfStm c ss1 ss2 ->
          typeCheckExpr env c NatType
       ++ typeCheckStms env ss1
       ++ typeCheckStms env ss2
     While c ss ->
          typeCheckExpr env c NatType
       ++ typeCheckStms env ss
        
typeCheckExpr :: Env -> Expr -> Type -> [Error]
typeCheckExpr env e t
 = case e of 
     Id n -> 
       maybe
         [("undeclared variable", n)]
         required
         (lookup n env)
     NatCon i -> required NatType
     StrCon s -> required StrType
     Add e1 e2 ->
          typeCheckExpr env e1 NatType
       ++ typeCheckExpr env e2 NatType
     Sub e1 e2 ->
          typeCheckExpr env e1 NatType
       ++ typeCheckExpr env e2 NatType
     Conc e1 e2 ->
          typeCheckExpr env e1 StrType
       ++ typeCheckExpr env e2 StrType
 where
  required :: Type -> [Error]
  required t'
   = if t==t'
       then []
       else [("expected: "++show t++"; actual: "++show t', show e)]
