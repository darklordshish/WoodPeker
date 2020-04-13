{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Control.Exception          (try)
import qualified Data.ByteString.Lazy.Char8 as L8
import           Network.HTTP.Client        ( defaultManagerSettings
                                            , newManager 
                                            )
import           Network.HTTP.Client.TLS    (tlsManagerSettings)
import           Data.Aeson
import qualified Data.ByteString.Char8      as S8
import qualified Data.Yaml                  as Yaml
import           Data.List
import           Lib
import           Network.HTTP.Simple
import           Control.Monad
import           Control.Monad.IO.Class    (liftIO)
import qualified Data.ByteString           as S
import qualified Data.Conduit.List         as CL
import           Network.HTTP.Simple
import           System.IO                 (stdout)

{-
main :: IO ()
main = forever $ do
    --url <- getLine
    --loadSiteByURL url
    url <- getLine
    request <- parseRequest url
    response <- httpLBS  request --"https://www.google.com"
    print request
    print response -}

data Person = Person String Int
instance ToJSON Person where
    toJSON (Person name age) = object
        [ "name" .= name
        , "age"  .= age
        ]

people :: [Person]
people = [Person "Alice" 30, Person "Bob" 35, Person "Charlie" 40]


main :: IO ()
main = do
    manager <- newManager tlsManagerSettings

    let request = setRequestManager manager "https://httpbin.org/get"
    response <- httpLBS request

    putStrLn $ "The status code was: " ++
               show (getResponseStatusCode response)
    print $ getResponseHeader "Content-Type" response
    L8.putStrLn $ getResponseBody response