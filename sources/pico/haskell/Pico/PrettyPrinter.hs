module Pico.PrettyPrinter where

import Pico.AbstractSyntax
import Text.PrettyPrint.HughesPJ

ppProgram :: Program -> Doc
ppProgram (ds, ss) = ppDecls ds $$ ppStms ss

ppDecls :: [Decl] -> Doc
ppDecls ds = text "declare" $$ (nest 1 (ppDecls' ds) <> text ";")
 where
  ppDecls' [] = empty
  ppDecls' [d] = ppDecl d
  ppDecls' (d:ds) = ppDecl d <> text "," $$ ppDecls' ds

ppDecl :: Decl -> Doc
ppDecl (n, t) = text n <+> text ":" <+> ppType t

ppType :: Type -> Doc
ppType NatType = text "natural"
ppType StrType = text "string"

ppStms :: [Stm] -> Doc
ppStms ss = ppStms' ss
 where
  ppStms' [] = empty
  ppStms' [s] = ppStm s
  ppStms' (s:ss) = ppStm s <> text ";" $$ ppStms' ss

ppStm :: Stm -> Doc
ppStm (Assign n e) = text n <+> text ":=" <+> ppExpr e
ppStm (IfStm c ss1 ss2)
 = text "if" <+> ppExpr c
 $$ nest 2 (text "then" <+> ppStms ss1)
 $$ nest 2 (text "else" <+> ppStms ss2)
 $$ text "fi"
ppStm (While c ss)
 = text "while" <+> ppExpr c <+> text "do"
 $$ nest 2 (ppStms ss)
 $$ text "od"

ppExpr :: Expr -> Doc
ppExpr (Id n) = text n
ppExpr (NatCon i) = int i
ppExpr (StrCon s) = text s
ppExpr (Add e1 e2) = ppExpr e1 <+> text "+" <+> ppExpr e2
ppExpr (Sub e1 e2) = ppExpr e1 <+> text "-" <+> ppExpr e2
ppExpr (Conc e1 e2) = ppExpr e1 <+> text "||" <+> ppExpr e2
