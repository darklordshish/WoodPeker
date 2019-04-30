module Lib
    ( someFunc
    , loadSiteByURL
    ) where

import           Network.HTTP.Conduit
import qualified System.Directory as Dir
import           System.IO


someFunc :: IO ()
someFunc = putStrLn "someFunc"


loadSiteByURL:: String -> IO ()
loadSiteByURL url = do 
    print url

  