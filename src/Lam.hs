module Lam where

import Data.List
import Syntax

-- Recebe um termo e retorna uma lista de variaveis livres.
freeVars :: TLam -> [Char]
freeVars (Var x) = [x]
freeVars (Abs x t) = filter (/= x) (freeVars t)
freeVars (App t1 t2) = nub (freeVars t1 ++ freeVars t2)

-- Implementação da função de substituição
subs :: Char -> TLam -> TLam -> TLam
subs x s (Var y) = if (x == y) then s else (Var y)
subs x s (Abs y t12)
    | x == y = Abs y t12 -- variável está ligada, não substitui
    | y `notElem` freeVars s = Abs y (subs x s t12) -- sem captura
    | otherwise =
        let y' = newVar (freeVars s ++ freeVars t12)
         in Abs y' (subs x s (subs y (Var y') t12)) -- α-conversão
subs x s (App t1 t2) = App (subs x s t1) (subs x s t2)

-- Gera uma nova variável que não está em used.
newVar :: [Char] -> Char
newVar used = head [c | c <- ['a' .. 'z'], c `notElem` used]

-- Recebe um termo lambda e retorna True se é um valor, i.e, se não é aplicação.
isVal :: TLam -> Bool
isVal (Var x) = True
isVal (Abs x t) = True
isVal (App _ _) = False

-- Implementação da semântica operacional call-by-value: um passo de beta redução
eval :: TLam -> TLam
eval (Var x) = Var x
eval (Abs x t) = Abs x t
eval (App (Abs x t12) t2) =
    if (isVal t2)
        then (subs x t2 t12)
        else
            let t2' = eval t2
             in (App (Abs x t12) t2')
eval (App t1 t2) =
    let t1' = eval t1
     in App t1' t2

-- Aplica varios passos do eval até que não tenha mais redex: eval recursivo
evaluation :: TLam -> TLam
evaluation t =
    let t' = eval t
     in if t == t' then t else evaluation t'

-- Definição de termos nameless
data TNameL
    = VarN Int -- Variável sem nome (índice de Brujin)
    | AbsN TNameL -- Abstração sem nome da variável
    | AppN TNameL TNameL -- Aplicação
    deriving (Eq, Show)

-- Contexto Gamma de variáveis livres
type Gamma = [(Char, Int)]
gamma1 :: Gamma
gamma1 = [('x', 4), ('y', 3), ('z', 2), ('a', 1), ('b', 0)]

-- Recebe um contexto de nomes gamma e um termo lambda com nomes, tal que as
-- variaveis livres do termo devem estar em gamma. A função deve retornar o termo
-- nameless correspondente
removeNames :: Gamma -> TLam -> TNameL
removeNames gamma (Var x) =
    case lookup x gamma of
        Just n -> VarN n
        Nothing -> error $ "Variable " ++ [x] ++ " not found in context"
removeNames gamma (Abs x t) =
    let gamma' = map (\(v, n) -> (v, n + 1)) gamma -- shift existing variables
        gamma'' = (x, 0) : gamma' -- add new bound variable at index 0
     in AbsN (removeNames gamma'' t)
removeNames gamma (App t1 t2) =
    AppN (removeNames gamma t1) (removeNames gamma t2)

-- Recebe um termo lambda sem nomes e um contexto gamma e produz um termo lambda com nome.
-- Para fazer isso, precisamos escolher nomes para as variáveis ligadas.
-- Podemos inicialmente escolher qualquer nome que não aparece em gamma.
restoreNames :: Gamma -> TNameL -> TLam
restoreNames gamma (VarN n) =
    case find (\(_, idx) -> idx == n) gamma of
        Just (c, _) -> Var c
        Nothing -> error $ "Index " ++ show n ++ " not found in context"
restoreNames gamma (AbsN t) =
    let newVarName = head [c | c <- ['a' .. 'z'], c `notElem` map fst gamma]
        gamma' = (newVarName, 0) : map (\(v, n) -> (v, n + 1)) gamma
     in Abs newVarName (restoreNames gamma' t)
restoreNames gamma (AppN t1 t2) =
    App (restoreNames gamma t1) (restoreNames gamma t2)

-- Função de deslocamento para termos nameless
shifting :: Int -> Int -> TNameL -> TNameL
shifting d c (VarN k) = if k >= c then VarN (k + d) else VarN k
shifting d c (AbsN t) = AbsN (shifting d (c + 1) t)
shifting d c (AppN t1 t2) = AppN (shifting d c t1) (shifting d c t2)

-- Função de substituição para termos nameless
subsNameL :: Int -> TNameL -> TNameL -> TNameL
subsNameL j s (VarN k) = if k == j then s else VarN k
subsNameL j s (AbsN t) = AbsN (subsNameL (j + 1) (shifting 1 0 s) t)
subsNameL j s (AppN t1 t2) = AppN (subsNameL j s t1) (subsNameL j s t2)

-- Implementação da avaliação para termos sem nome
evalNameL :: TNameL -> TNameL
evalNameL (VarN n) = VarN n
evalNameL (AbsN t) = AbsN t
evalNameL (AppN (AbsN t12) t2) =
    if isValNameL t2
        then shifting (-1) 0 (subsNameL 0 (shifting 1 0 t2) t12)
        else AppN (AbsN t12) (evalNameL t2)
evalNameL (AppN t1 t2) = AppN (evalNameL t1) t2

-- Função auxiliar para verificar se um termo nameless é um valor
isValNameL :: TNameL -> Bool
isValNameL (VarN _) = True
isValNameL (AbsN _) = True
isValNameL (AppN _ _) = False

-- Implementação do evaluation que aplica recursivamente
-- o eval até que não tenha mais redex
evaluationNameL :: TNameL -> TNameL
evaluationNameL t =
    let t' = evalNameL t
     in if t == t' then t else evaluationNameL t'
