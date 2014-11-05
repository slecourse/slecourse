module Pico.Compiler where

import Pico.AbstractSyntax
import Pico.AssemblerCode
import Control.Monad.State

-- Instruction sequences with labeling
type LabeledInstrs = State Int [Instr]

-- Generate next jump label
nextLabel :: State Int String
nextLabel = do
               i <- get
               let i' = i+1
               put i'
               return ("L" ++ show i')

-- Compile the program to instructions
compileProgram :: Program -> [Instr]
compileProgram (ds,ss) = fst $ runState is (0::Int)
 where
  is = do
   is1 <- compileDecls ds
   is2 <- compileStms ss
   return (is1 ++ is2) 

-- Compile declarations to instructions
compileDecls :: [Decl] -> LabeledInstrs
compileDecls ds = mapM compileDecl ds
  where
    compileDecl (n, NatType) = return (DclInt n)
    compileDecl (n, StrType) = return (DclStr n)

-- Compile statements to instructions
compileStms :: [Stm] -> LabeledInstrs
compileStms ss = mapM compileStm ss >>= return . concat
  where
    compileStm :: Stm -> LabeledInstrs
    compileStm (Assign n e)
      = do
           let e' = compileExpr e
           return ([Lvalue n]++e'++[AssignOp])
    compileStm (IfStm c ss1 ss2)
      = do
           elseLabel <- nextLabel
           endLabel <- nextLabel
           let c' = compileExpr c
           ss1' <- compileStms ss1
           ss2' <- compileStms ss2
           return (
                    c'
                 ++ [GoZero elseLabel]
                 ++ ss1'
                 ++ [Go endLabel, Label elseLabel]
                 ++ ss2'
                 ++ [Label endLabel]
                  )
    compileStm (While c ss)
      = do
           entryLabel <- nextLabel
           endLabel <- nextLabel
           let c' = compileExpr c
           ss' <- compileStms ss
           return (
                    [Label entryLabel]
                 ++ c'
                 ++ [GoZero endLabel]
                 ++ ss'
                 ++ [Go entryLabel, Label endLabel]
                  )

-- Compile expressions to instructions
compileExpr :: Expr -> [Instr]
compileExpr (Id n) = [Rvalue n]
compileExpr (NatCon i) = [PushNat i]
compileExpr (StrCon s) = [PushStr s]
compileExpr (Add e1 e2) = compileExpr e1 ++ compileExpr e2 ++ [AddOp]
compileExpr (Sub e1 e2) = compileExpr e1 ++ compileExpr e2 ++ [SubOp]
compileExpr (Conc e1 e2) = compileExpr e1 ++ compileExpr e2 ++ [ConcOp]
