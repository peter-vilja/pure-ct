module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Argonaut.Core (Json)
import Data.Argonaut.Parser (jsonParser)
import Data.Either (Either)

userData :: String
userData = "[{\"name\": \"Tom\", \"age\": 25}, {\"name\": \"John\", \"age\": 30}]"

parseUsers :: String -> Either String Json
parseUsers users = jsonParser users

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log $ show $ parseUsers userData
