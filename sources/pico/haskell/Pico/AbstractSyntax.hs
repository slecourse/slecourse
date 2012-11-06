module Pico.AbstractSyntax where

type Name = String

data Type = NatType | StrType
     deriving (Eq, Show, Read)
	  
type Program = ([Decl], [Stm])

type Decl = (Name,Type)

data Stm
 = Assign Name Expr
 | IfStm Expr [Stm] [Stm]
 | While Expr [Stm]
     deriving (Eq, Show, Read)

data Expr
 = Id Name
 | NatCon Int
 | StrCon String
 | Add Expr Expr
 | Sub Expr Expr
 | Conc Expr Expr
     deriving (Eq, Show, Read)
