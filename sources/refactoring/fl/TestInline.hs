module TestInline where

import System
import AbstractSyntax
import ParserLib
import Parser
import PrettyPrinter
import Inline

main = do
     (file1:(file2:_)) <- getArgs
     program <- parseFile program file1
     let (Just program') = inline program
     ppToFile file2 program'

