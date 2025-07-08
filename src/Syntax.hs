module Syntax where

-- Representação abstrata do cálculo lambda (com nomes)
data TLam
    = Var Char -- Variável (x, y)
    | Abs Char TLam -- Abstração (\x.x)
    | App TLam TLam -- Aplicação ((f x))
    deriving (Show, Eq)
