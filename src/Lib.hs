module Lib
    ( someFunc
    ) where

import Network.HTTP.Conduit

someFunc :: IO ()
someFunc = putStrLn "someFunc"
