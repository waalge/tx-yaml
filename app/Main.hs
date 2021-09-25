module Main where

import MyLib (buildTx)

main :: IO ()
main = do
  putStrLn "What file?"
  fp <- getLine 
  buildTx fp 
