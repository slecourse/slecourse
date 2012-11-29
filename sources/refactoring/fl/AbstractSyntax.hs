module AbstractSyntax where

import Data.Generics

data Function = Function Name [Name] Expr
     deriving (Eq,Show)
type Name = String
data Expr = 
       Literal Int
     | Argument Name
     | Binary Ops Expr Expr
     | IfThenElse Expr Expr Expr 
     | Apply Name [Expr]
     | Let Name Expr Expr
     | Focus Expr
     deriving (Eq,Show)
data Ops= Equal | Plus | Minus
     deriving (Eq,Show)
