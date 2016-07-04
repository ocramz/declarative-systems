{-# language TypeSynonymInstances #-}
module System.Declarative where


-- import System.Declarative.Observe

import qualified System.Environment as E





class Observe a where
  observe :: a -> IO (Maybe a)


class Control a where
  control :: a -> v -> IO ()



-- instances


-- * Environment variables 

instance Observe String where
  observe = E.lookupEnv



-- * Files
