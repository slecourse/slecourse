{----------------------------------------------------------------------------

Abstract syntax of JOOS, based on:

    David A. Watt. JOOS action semantics. Version 1, available from
    http://www.dcs.gla.ac.uk/~daw/publications/JOOS.ps, October 1997. 

Modifications:

  o StatFocus
  o StringLiterals

----------------------------------------------------------------------------}

module Datatypes where

import Data.Generics
import Control.Monad

data Assignment		= Assignment Identifier Expression
                          deriving (Eq, Show, Typeable, Data)
data InstanceCreation	= InstanceCreation Identifier Arguments
                          deriving (Eq, Show, Typeable, Data)
data MethodInvocation	= ExpressionInvocation Expression Identifier Arguments
			| SuperInvocation Identifier Arguments
                          deriving (Eq, Show, Typeable, Data)
data Arguments		= Arguments [Expression]
                          deriving (Eq, Show, Typeable, Data)
data Expression		= Literal Literal
			| Identifier Identifier
			| This
			| PrefixExpr PrefixOperator Expression
			| InfixExpr Expression InfixOperator Expression
			| AndOrExpr Expression AndOr Expression
			| InstanceOf Expression Identifier
			| TypeCast Type Expression
			| BracketExpr Expression
			| AssignmentExpr Assignment
			| InstanceCreationExpr InstanceCreation
			| MethodInvocationExpr MethodInvocation
                          deriving (Eq, Show, Typeable, Data)
data AndOr		= AND | OR
                          deriving (Eq, Show, Typeable, Data)
data PrefixOperator	= Neg | Fac
                          deriving (Eq, Show, Typeable, Data)
data InfixOperator	= Eq | NEQ | Lt | Gt | LEQ | GEQ
			| PLUS | MINUS | MUL | DIV | MOD
                          deriving (Eq, Show, Typeable, Data)
data Literal		= BooleanLit BooleanLiteral
			| IntegerLit IntegerLiteral
			| Null
			| StringLit StringLiteral
                          deriving (Eq, Show, Typeable, Data)
data BooleanLiteral	= TRUE | FALSE
                          deriving (Eq, Show, Typeable, Data)
type IntegerLiteral	= Integer
type StringLiteral	= String
type Identifier		= String

data BlockStatements	= BlockStatements [VariableDeclaration] [Statement]
                          deriving (Eq, Show, Typeable, Data)
data Statement		= Skip
			| Block BlockStatements
			| AssignmentStat Assignment
			| InstanceCreationStat InstanceCreation
			| MethodInvocationStat MethodInvocation
			| ReturnStat (Maybe Expression)
			| IfStat Expression Statement Statement
			| WhileStat Expression Statement
                       --- Additions
                        | StatFocus Statement
                          deriving (Eq, Show, Typeable, Data)

data ClassDeclaration	= ClassDecl FinalOpt Identifier Identifier
                            [FieldDeclaration]
                            ConstructorDeclaration
			    [MethodDeclaration]
                          deriving (Eq, Show, Typeable, Data)
type FinalOpt		= Bool
data FieldDeclaration	= FieldDecl Type Identifier
                          deriving (Eq, Show, Typeable, Data)
data ConstructorDeclaration
			= ConstructorDecl Identifier FormalParameters
                            Arguments BlockStatements
                          deriving (Eq, Show, Typeable, Data)
data MethodDeclaration	= MethodDecl (Maybe Type) Identifier FormalParameters
                            BlockStatements
                          deriving (Eq, Show, Typeable, Data)
data FormalParameters	= FormalParams [FormalParameter]
                          deriving (Eq, Show, Typeable, Data)
data FormalParameter	= FormalParam Type Identifier
                          deriving (Eq, Show, Typeable, Data)
data VariableDeclaration
			= VariableDecl Type Identifier
                          deriving (Eq, Show, Typeable, Data)
data Type		= INT | BOOLEAN | Type Identifier
                          deriving (Eq, Show, Typeable, Data)

