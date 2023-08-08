module Main (main) where

import Pyramid (projectName)


main :: IO ()
main = putStrLn ("Tests for " ++ projectName)
