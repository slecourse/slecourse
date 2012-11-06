module Pico.FlowChart where

import Text.PrettyPrint.HughesPJ

type FlowChart = ([Box], [Arrow])
type Box = (Id, BoxType)
type Id = String -- Identifier for boxes
type Text = String -- Text to show
data BoxType
 = Start
 | End
 | Decision String
 | Activity String
type Arrow = ((Id, FromType), Id)
data FromType
 = FromStart
 | FromActivity
 | FromYes
 | FromNo


writeFlowChart :: FlowChart -> String -> IO ()
writeFlowChart fc file
 = do
      let s = showFlowChart fc
      writeFile file s

showFlowChart :: FlowChart -> String
showFlowChart (bs,as) = show main
 where
  main =
                  text "digraph"
              <+> text "FlowChart"
              <+> text "{"
              $$ nest 1 (vcat (map box bs))
              $$ nest 1 (vcat (map arrow as))
              $$ text "}"

box :: Box -> Doc

box (i, Start)
 =     text i
   <+> text "[label=\"Start\", shape=box, style=bold];"

box (i, End)
 = text i <+> text "[label=\"End\", shape=box, style=bold];"

box (i, Decision s)
 = text i <+> text "[label=\"" <+> text s <+> text "\", shape=diamond];"

box (i, Activity s)
 = text i <+> text "[label=\"" <+> text s <+> text "\", shape=box];"

arrow :: Arrow -> Doc
arrow ((from,ty), to)
 =     text from
   <+> text "->" 
   <+> text to 
   <+> text "[label=\"" <+> text label 
   <+> text "\", headport=" <+> text headport 
   <+> text ", tailport=" <+> text tailport 
   <+> text "]"
 where
  label = case ty of
           FromYes -> "Yes"
           FromNo -> "No"
           _ -> ""
  headport = "n"       
  tailport = case ty of
              FromYes -> "sw"
              FromNo -> "se"
              _ -> "s"       
