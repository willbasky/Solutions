module Main (main) where

import Pyramid (wMVector)
import qualified Data.ByteString.Char8 as BC

main :: IO ()
main = do
  case wMVector 322 156 of
    Just res ->
        BC.putStrLn $ BC.pack "wMVector 322 156 is " <> BC.pack (show res)
    Nothing -> error "No result"
