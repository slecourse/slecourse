module TestEvaluator where

import System
import AbstractSyntax
import ParserLib
import Parser
import Evaluator

main = do
     (file1:(file2:(expected:_))) <- getArgs
     program <- parseFile program file1
     expr <- parseFile expr file2
     let actual = eval program expr
     if actual == Just (read expected)
     	then return ()
	else error "assertion error"
