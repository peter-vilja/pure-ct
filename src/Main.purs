module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Argonaut.Core (Json)
import Data.Argonaut.Parser (jsonParser)
import Data.Either (Either)
import Data.Maybe (Maybe(Just))
import Data.String (toUpper, trim)

userData :: String
userData = "[{\"name\": \"Tom\", \"age\": 25}, {\"name\": \"John\", \"age\": 30}]"

parseUsers :: String -> Either String Json
parseUsers users = jsonParser users

-- Simple usage of Maybe
-- main :: forall e. Eff (console :: CONSOLE | e) Unit
-- main = do
--   log $ show $ parseUsers userData




-- functor should preserve composition morphisms
main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  -- log $ show $ map (toUpper <<< trim) $ Just(" john ")
  log $ show $ map toUpper <<< map trim $ Just(" john ")
  -- log $ show $ map toUpper (map trim) $ Just(" john ")
