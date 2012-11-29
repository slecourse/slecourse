module PrettyPrinter where

import AbstractSyntax

-- Pretty-print to file

ppToFile f x = do
        let s = prettyPrint x
	writeFile f s

class Pp x where prettyPrint :: x -> String

instance Pp x => Pp [x]
  where
    prettyPrint  = concat . map ((++"\n") . prettyPrint)

instance Pp Function
  where
    prettyPrint (Function n ns e) =
    	 concat [n, concat (map (\n -> " " ++ n) ns)," = ",prettyPrint e]

instance Pp Expr
  where
    prettyPrint (Literal i) = show i
    prettyPrint (Argument n) = n
    prettyPrint (Binary o x y) = concat ["(",prettyPrint x,prettyPrint o,prettyPrint y,")"]
    prettyPrint (IfThenElse x y z) = concat ["if ",prettyPrint x," then ",prettyPrint y," else ",prettyPrint z]
    prettyPrint (Apply n es) = concat ["(",concat (n:map (\e -> " " ++ prettyPrint e) es),")"]
    prettyPrint (Let n e1 e2) = concat ["let ",n, " = ", prettyPrint e1, " in ", prettyPrint e2]
    prettyPrint (Focus e) = concat ["<< ", prettyPrint e, " >>"]


instance Pp Ops
  where
    prettyPrint Equal = "=="
    prettyPrint Plus = " + "
    prettyPrint Minus = " - "
