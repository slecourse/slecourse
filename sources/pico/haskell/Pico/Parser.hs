module Pico.Parser where

import Pico.AbstractSyntax
import Text.Parsec

{- Main functionality -}

type Parser x = Parsec String () x

parse :: String -> IO (Either ParseError Program)
parse file
 = do
      content <- readFile file
      return $ runP program () file content


{- Context-free syntax -}

program :: Parser Program
program = do
             spaces
             special "begin"
             ds <- decls
             ss <- stms
             special "end"
             eof
             return (ds, ss)

decls :: Parser [Decl]
decls = do
           special "declare"
           ds <- sepBy decl (special ",")
           special ";"
           return ds

decl :: Parser Decl
decl = do
          n <- name
          special ":"
          t <- tYpe
          return (n, t)

tYpe :: Parser Type
tYpe = choice [
              special "natural" >> return NatType, 
              special "string" >> return StrType
              ]

stms :: Parser [Stm]
stms = sepBy stm (special ";")

stm :: Parser Stm
stm = choice [
             try assign,
             try ifStm,
             try while
             ]

assign :: Parser Stm
assign = do
            n <- name
            special ":="
            e <- expr
            return (Assign n e)

ifStm :: Parser Stm
ifStm = do
           special "if"
           c <- expr
           special "then"
           t <- stms
           special "else"
           e <- stms
           special "fi"
           return (IfStm c t e)

while :: Parser Stm
while = do
           special "while"
           c <- expr
           special "do"
           b <- stms
           special "od"
           return (While c b)

expr :: Parser Expr
expr = do
          t <- term
          option t (expr_rest t)

term :: Parser Expr
term = choice [ 
              name >>= return . Id,
              str >>= return . StrCon, 
              nat >>= return . NatCon, 
              bracket
              ]

bracket :: Parser Expr
bracket = do
             special "("
             e <- expr
             special ")"
             return e

expr_rest :: Expr -> Parser Expr
expr_rest e1 = 
  do
     f <- choice [
                 special "||" >> return Conc,
                 special "+" >> return Add,
                 special "-" >> return Sub 
                 ]
     e2 <- expr
     return (f e1 e2)

{- Lexical syntax -}

name :: Parser String
name = do
          h <- letter
          t <- many alphaNum 
          spaces
          return (h:t)

nat :: Parser Int
nat = do
         ds <- many1 digit
         spaces
         return (read ds :: Int)

str :: Parser String
str = do
         string "\""
         cs <- many (noneOf "\"")
         string "\""
         spaces
         return cs

special :: String -> Parser ()
special s = do
               string s
               spaces

