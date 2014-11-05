module Pico.Recognizer where

import Text.Parsec

-- The type of recognition
type Recognizer = Parsec String () ()

-- Top-level recognition function
recognize :: String -> IO (Either ParseError ())
recognize file
 = do
      content <- readFile file
      return $ runP program () file content

{- Context-free syntax -}

program :: Recognizer
program = do
             spaces
             special "begin"
             decls
             stms
             special "end"
             eof

decls :: Recognizer
decls = do
           special "declare"
           sepBy decl (special ",")
           special ";"

decl :: Recognizer
decl = do
          name
          special ":"
          tYpe

tYpe :: Recognizer
tYpe = choice [special "natural", special "string"]

stms :: Recognizer
stms = do 
          sepBy stm (special ";")
          return () -- Exercise: Why is this line needed?

stm :: Recognizer
stm = choice [
             try assign,
             try ifStm,
             try while
             ]

assign :: Recognizer
assign = do
            name
            special ":="
            expr

ifStm :: Recognizer
ifStm = do
           special "if"
           expr
           special "then"
           stms
           special "else"
           stms
           special "fi"

while :: Recognizer
while = do
           special "while"
           expr
           special "do"
           stms
           special "od"

expr :: Recognizer
expr = do
          term
          optional expr_rest

term :: Recognizer
term = choice [name, str, nat, bracket]

bracket :: Recognizer
bracket = do
             special "("
             expr
             special ")"

expr_rest :: Recognizer
expr_rest = do
          choice [special "||", special "+", special "-"]
          expr

{- Lexical syntax -}

name :: Recognizer
name = do
          letter
          many alphaNum 
          spaces

nat :: Recognizer
nat = do
         many1 digit
         spaces

str :: Recognizer
str = do
         string "\""
         many (noneOf "\"")
         string "\""
         spaces

special :: String -> Recognizer
special s = do
               string s
               spaces
