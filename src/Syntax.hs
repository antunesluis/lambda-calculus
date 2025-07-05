module Syntax where

-- Representação abstrata do cálculo lambda (com nomes)
data TLam
    = Var Char -- Variável (ex: x, y)
    | Abs Char TLam -- Abstração (ex: λx.x)
    | App TLam TLam -- Aplicação (ex: (f x))
    deriving (Show, Eq) -- Para facilitar debug
