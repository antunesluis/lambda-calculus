module Main where

import Lam
import Parser
import System.Environment
import System.IO

evalLambdaString :: String -> IO ()
evalLambdaString input = do
    putStrLn $ "Input: " ++ input

    -- Parse da expressão
    let parsed = parseLambda input
    putStrLn $ "Parsed: " ++ show parsed

    -- Mostra variáveis livres
    let fvs = freeVars parsed
    putStrLn $ "Free variables: " ++ show fvs

    -- Avaliação com nomes
    let result = evaluation parsed
    putStrLn $ "Result: " ++ show result

    -- Conversão para nameless e avaliação
    let nameless = removeNames gamma1 parsed
    putStrLn $ "Nameless: " ++ show nameless

    let namelessResult = evaluationNameL nameless
    putStrLn $ "Nameless result: " ++ show namelessResult

    -- Restaura nomes do resultado
    let restored = restoreNames gamma1 namelessResult
    putStrLn $ "Restored: " ++ show restored
    putStrLn ""

processFile :: String -> IO ()
processFile filename = do
    content <- readFile filename
    evalLambdaString $ filter (/= '\n') content

interactiveMode :: IO ()
interactiveMode = do
    putStr "λ> "
    hFlush stdout
    input <- getLine
    if input == "quit"
        then putStrLn "Saindo..."
        else evalLambdaString input >> interactiveMode

main :: IO ()
main = do
    args <- getArgs
    case args of
        [] -> interactiveMode
        [filename] -> processFile filename
        _ -> putStrLn "Uso: programa [arquivo]"
