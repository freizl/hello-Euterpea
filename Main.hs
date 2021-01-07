module Main where

import Euterpea


x1 = c 4 en :+: g 4 en :+: c 5 en :+: g 5 en

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  -- writeMidi "test.mid" x1
  playDev 1 x1
