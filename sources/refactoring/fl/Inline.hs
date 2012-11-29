module Inline where

import AbstractSyntax

-- Iterate over all functions

inline :: [Function] -> Maybe [Function]
inline = mapM inline
  where
    inline (Function n ns e)
     = copy e >>= Just . Function n ns


-- Copy mode of inlining
 
copy :: Expr -> Maybe Expr
copy x@(Literal _) = Just x
copy x@(Argument _) = Just x
copy (Binary o x y) = do
     x' <- copy x
     y' <- copy y
     Just (Binary o x' y')
copy (IfThenElse x y z) = do
     x' <- copy x
     y' <- copy y
     z' <- copy z
     Just (IfThenElse x' y' z')
copy (Apply n es) = do
     es' <- mapM copy es
     Just (Apply n es')
copy (Let n x y) = do
     x' <- copy x
     y' <- copy y
     Just (Let n x' y')
copy (Focus (Let n x y)) = replace n x y
copy (Focus x) = copy x


-- Replace mode of inlining

replace :: Name -> Expr -> Expr -> Maybe Expr
replace n e = replace'
  where
    replace' x@(Literal _) = Just x
    replace' (Argument n')
      = Just (if n==n' 
                then e 
                else Argument n')
    replace' (Binary o x y) = do
         x' <- replace' x
         y' <- replace' y
         Just (Binary o x' y')
    replace' (IfThenElse x y z) = do
         x' <- replace' x
         y' <- replace' y
         z' <- replace' z
         Just (IfThenElse x' y' z')
    replace' (Apply n es) = do
         es' <- mapM replace' es
         Just (Apply n es')
    replace' (Let n x y) = do
         x' <- replace' x
         y' <- replace' y
         Just (Let n x' y')
    replace' (Focus _)
      = Nothing -- no support for nested foci
