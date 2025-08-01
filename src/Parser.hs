{-# OPTIONS_GHC -w #-}

module Parser where

import Control.Applicative (Applicative (..))
import Control.Monad (ap)
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Data.Char
import Syntax (TLam (..))

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn
    = HappyTerminal (Token)
    | HappyErrorToken Prelude.Int
    | HappyAbsSyn4 (TLam)

{- to allow type-synonyms as our monads (likely
 - with explicitly-specified bind and return)
 - in Haskell98, it seems that with
 - /type M a = .../, then /(HappyReduction M)/
 - is not allowed.  But Happy is a
 - code-generator that can just substitute it.
type HappyReduction m =
	   Prelude.Int
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)]
	-> HappyStk HappyAbsSyn
	-> [(Token)] -> m HappyAbsSyn
-}

action_0
    , action_1
    , action_2
    , action_3
    , action_4
    , action_5
    , action_6
    , action_7
    , action_8
    , action_9
    , action_10
    , action_11
    , action_12
    , action_13 ::
        () =>
        Prelude.Int ->
        ( {-HappyReduction (HappyIdentity) = -}
          Prelude.Int ->
          (Token) ->
          HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn) ->
          [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)] ->
          HappyStk HappyAbsSyn ->
          [(Token)] ->
          (HappyIdentity) HappyAbsSyn
        )
happyReduce_1
    , happyReduce_2
    , happyReduce_3
    , happyReduce_4
    , happyReduce_5
    , happyReduce_6 ::
        () =>
        ( {-HappyReduction (HappyIdentity) = -}
          Prelude.Int ->
          (Token) ->
          HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn) ->
          [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)] ->
          HappyStk HappyAbsSyn ->
          [(Token)] ->
          (HappyIdentity) HappyAbsSyn
        )
happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList =
    Happy_Data_Array.listArray
        (0, 24)
        ( [ 704
          , 32772
          , 0
          , 640
          , 0
          , 11264
          , 1024
          , 0
          , 11265
          , 0
          , 0
          , 0
          ]
        )

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where
    token_strs = ["error", "%dummy", "%start_parserLamb", "Expr", "AppExpr", "Atom", "lam", "var", "'.'", "'('", "')'", "%eof"]
    bit_start = st Prelude.* 12
    bit_end = (st Prelude.+ 1) Prelude.* 12
    read_bit = readArrayBit happyExpList
    bits = Prelude.map read_bit [bit_start .. bit_end Prelude.- 1]
    bits_indexed = Prelude.zip bits [0 .. 11]
    token_strs_expected = Prelude.concatMap f bits_indexed
    f (Prelude.False, _) = []
    f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (7) = happyShift action_2
action_0 (8) = happyShift action_6
action_0 (10) = happyShift action_7
action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_4
action_0 (6) = happyGoto action_5
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (7) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (8) = happyShift action_10
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (12) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (8) = happyShift action_6
action_4 (10) = happyShift action_7
action_4 (6) = happyGoto action_9
action_4 _ = happyReduce_2

action_5 _ = happyReduce_4

action_6 _ = happyReduce_5

action_7 (7) = happyShift action_2
action_7 (8) = happyShift action_6
action_7 (10) = happyShift action_7
action_7 (4) = happyGoto action_8
action_7 (5) = happyGoto action_4
action_7 (6) = happyGoto action_5
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (11) = happyShift action_12
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_3

action_10 (9) = happyShift action_11
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (7) = happyShift action_2
action_11 (8) = happyShift action_6
action_11 (10) = happyShift action_7
action_11 (4) = happyGoto action_13
action_11 (5) = happyGoto action_4
action_11 (6) = happyGoto action_5
action_11 _ = happyFail (happyExpListPerState 11)

action_12 _ = happyReduce_6

action_13 _ = happyReduce_1

happyReduce_1 = happyReduce 4 4 happyReduction_1
happyReduction_1
    ( (HappyAbsSyn4 happy_var_4)
            `HappyStk` _
            `HappyStk` (HappyTerminal (TokenVar happy_var_2))
            `HappyStk` _
            `HappyStk` happyRest
        ) =
        HappyAbsSyn4
            ( Abs happy_var_2 happy_var_4
            )
            `HappyStk` happyRest

happyReduce_2 = happySpecReduce_1 4 happyReduction_2
happyReduction_2 (HappyAbsSyn4 happy_var_1) =
    HappyAbsSyn4
        ( happy_var_1
        )
happyReduction_2 _ = notHappyAtAll

happyReduce_3 = happySpecReduce_2 5 happyReduction_3
happyReduction_3
    (HappyAbsSyn4 happy_var_2)
    (HappyAbsSyn4 happy_var_1) =
        HappyAbsSyn4
            ( App happy_var_1 happy_var_2
            )
happyReduction_3 _ _ = notHappyAtAll

happyReduce_4 = happySpecReduce_1 5 happyReduction_4
happyReduction_4 (HappyAbsSyn4 happy_var_1) =
    HappyAbsSyn4
        ( happy_var_1
        )
happyReduction_4 _ = notHappyAtAll

happyReduce_5 = happySpecReduce_1 6 happyReduction_5
happyReduction_5 (HappyTerminal (TokenVar happy_var_1)) =
    HappyAbsSyn4
        ( Var happy_var_1
        )
happyReduction_5 _ = notHappyAtAll

happyReduce_6 = happySpecReduce_3 6 happyReduction_6
happyReduction_6
    _
    (HappyAbsSyn4 happy_var_2)
    _ =
        HappyAbsSyn4
            ( happy_var_2
            )
happyReduction_6 _ _ _ = notHappyAtAll

happyNewToken action sts stk [] =
    action 12 12 notHappyAtAll (HappyState action) sts stk []
happyNewToken action sts stk (tk : tks) =
    let cont i = action i i tk (HappyState action) sts stk tks
     in case tk of
            TokenLam -> cont 7
            TokenVar happy_dollar_dollar -> cont 8
            TokenPoint -> cont 9
            TokenOB -> cont 10
            TokenCB -> cont 11
            _ -> happyError' ((tk : tks), [])

happyError_ explist 12 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk : tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parserLamb tks = happyRunIdentity happySomeParser
  where
    happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll)

happySeq = happyDontSeq

parseError :: [Token] -> a
parseError _ = error "Parse error"

data Token
    = TokenVar Char
    | TokenPoint
    | TokenOB
    | TokenCB
    | TokenLam
    deriving (Show)

lexer :: String -> [Token]
lexer [] = []
lexer (c : cs)
    | isSpace c = lexer cs
    | isAlpha c && c /= 'l' = TokenVar c : lexer cs
    | c == 'l' && take 2 cs == "am" = TokenLam : lexer (drop 2 cs)
    | c == '\\' = TokenLam : lexer cs
    | c == '.' = TokenPoint : lexer cs
    | c == '(' = TokenOB : lexer cs
    | c == ')' = TokenCB : lexer cs
    | c == 'λ' = TokenLam : lexer cs
    | isAlpha c = TokenVar c : lexer cs
    | otherwise = error $ "Invalid character: " ++ [c]

parseLambda :: String -> TLam
parseLambda = parserLamb . lexer
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $

data Happy_IntList = HappyCons Prelude.Int Happy_IntList

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
    happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) =
    (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

indexShortOffAddr arr off = arr Happy_Data_Array.! off

{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)

readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)

newtype HappyState b c
    = HappyState
        ( Prelude.Int -> -- token number
          Prelude.Int -> -- token number (yes, again)
          b -> -- token semantic value
          HappyState b c -> -- current state
          [HappyState b c] -> -- state stack
          c
        )

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
    let i = (case x of HappyErrorToken (i) -> i)
     in --     trace "shifting the error token" $
        new_state i i tk (HappyState (new_state)) ((st) : (sts)) (stk)
happyShift new_state i tk st sts stk =
    happyNewToken new_state ((st) : (sts)) ((HappyTerminal (tk)) `HappyStk` stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk =
    happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk =
    action nt j tk st ((st) : (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk =
    happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))) : (_))) (v1 `HappyStk` stk') =
    let r = fn v1
     in happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk =
    happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_) : (sts@(((st@(HappyState (action))) : (_))))) (v1 `HappyStk` v2 `HappyStk` stk') =
    let r = fn v1 v2
     in happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk =
    happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_) : (((_) : (sts@(((st@(HappyState (action))) : (_))))))) (v1 `HappyStk` v2 `HappyStk` v3 `HappyStk` stk') =
    let r = fn v1 v2 v3
     in happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk =
    happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk =
    case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
        sts1@(((st1@(HappyState (action))) : (_))) ->
            let r = fn stk -- it doesn't hurt to always seq here...
             in happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk =
    happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
    case happyDrop k ((st) : (sts)) of
        sts1@(((st1@(HappyState (action))) : (_))) ->
            let drop_stk = happyDropStk k stk
             in happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk =
    happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
    case happyDrop k ((st) : (sts)) of
        sts1@(((st1@(HappyState (action))) : (_))) ->
            let drop_stk = happyDropStk k stk

                _ = nt :: Prelude.Int
                new_state = action
             in happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_) : (t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1) :: Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

happyGoto action j tk st = action j j tk (HappyState action)

-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
    let i = (case x of HappyErrorToken (i) -> i)
     in --      trace "failing" $
        happyError_ explist i tk
{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts)
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
    --      trace "entering error recovery" $
    action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions

-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
