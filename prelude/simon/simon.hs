#!/usr/bin/env runghc
import Control.Monad
import System.IO

main :: IO ()
main = do
    let moves = map pickLetter $ show pi
    hSetBuffering stdin NoBuffering
    mapM (challenge . flip take moves) [1 ..]
    print moves
    getChar >>= print

challenge :: String -> IO ()
challenge moves = do
    putStrLn moves
    readMoves moves
    putStrLn ""

readMoves :: String -> IO ()
readMoves expected = do
    results <- zipWithM (liftM2 (==)) (repeat getChar) (map pure expected)
    if and results then pure () else error "You lose"

pickLetter :: Char -> Char
pickLetter ch = "wasd" !! (fromEnum ch `mod` 4)
-- ^10 ------------------------------------------------------------------ 80> --

{- prelude-10-80/template1 (mynick), ghc 9.2.5

https://hackage.haskell.org/package/base/docs/Prelude.html

-}
