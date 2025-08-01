{
module Parser where
import Data.Char
import Syntax (TLam(..))
}

%name parserLamb
%tokentype { Token }
%error { parseError }

-- Token
%token
    lam     { TokenLam }
    var     { TokenVar $$ }
    '.'     { TokenPoint }
    '('     { TokenOB }
    ')'     { TokenCB }
%%

-- Regras de produção

-- Abstração lambda (\x. x)
Expr :: { TLam }
    : lam var '.' Expr        { Abs $2 $4 }
    | AppExpr                 { $1 }

-- Aplicação (f x)
AppExpr :: { TLam }
    : AppExpr Atom            { App $1 $2 }
    | Atom                    { $1 }

-- Variavel ou parênteses
Atom :: { TLam }
    : var                     { Var $1 }
    | '(' Expr ')'            { $2 }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data Token 
    = TokenVar Char
    | TokenPoint
    | TokenOB
    | TokenCB
    | TokenLam 
    deriving Show

-- Converte uma string em uma lista de tokens
lexer :: String -> [Token]
lexer [] = []
lexer (c:cs)
    | isSpace c = lexer cs
    | isAlpha c && c /= 'l' = TokenVar c : lexer cs
    | c == 'l' && take 2 cs == "am" = TokenLam : lexer (drop 2 cs)
    | c == '\\' = TokenLam : lexer cs
    | c == '.'  = TokenPoint : lexer cs
    | c == '('  = TokenOB : lexer cs
    | c == ')'  = TokenCB : lexer cs
    | c == 'λ'  = TokenLam : lexer cs
    | isAlpha c = TokenVar c : lexer cs
    | otherwise = error $ "Invalid character: " ++ [c]

parseLambda :: String -> TLam
parseLambda = parserLamb . lexer
}
