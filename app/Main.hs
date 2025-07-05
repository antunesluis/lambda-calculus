module Main where

import Parser (lexer, parseLambda)

testParser :: String -> IO ()
testParser input = do
    putStrLn $ "Input: " ++ input
    putStrLn $ "Tokens: " ++ show (lexer input)
    let parsed = parseLambda input
    putStrLn $ "Parsed: " ++ show parsed
    putStrLn ""

main :: IO ()
main = do
    putStrLn "=== Testing Lambda Calculus Parser ==="

    putStrLn "Test 1: Simple variable"
    testParser "x"

    putStrLn "Test 2: Identity function"
    testParser "lam x . x"

    putStrLn "Test 3: Simple application"
    testParser "(x y)"

    putStrLn "Test 4: Identity application"
    testParser "((lam x . x) y)"

    putStrLn "Test 5: Original complex expression"
    testParser "(((lam x . x) (lam y . y)) z)"
