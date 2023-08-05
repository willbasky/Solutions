module Main (main) where

import Nitka (projectName)


main :: IO ()
main = putStrLn ("Tests for " ++ projectName)
