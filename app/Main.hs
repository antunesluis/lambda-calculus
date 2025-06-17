module Main where

import ParserToDo (lexer, parserlamb)

-- import Grammar (calc, lexer, Exp)

main :: IO ()
main = do
    input <- getContents
    let result = parserlamb (lexer input)
    --   let result = calc (lexer input)
    print result
