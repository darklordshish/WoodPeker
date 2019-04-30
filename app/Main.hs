module Main where
import Data.List
import Lib

main :: IO ()
main = do
    url <- getLine
    loadSiteByURL url
