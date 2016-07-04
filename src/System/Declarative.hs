module System.Declarative where


import System.Declarative.Observe

import qualified System.Environment as E




-- | Observable: what state is an entity in?
class Observable a where
  observe :: a -> IO (Maybe String)


-- | Controllable: force an entity into a given state
class Controllable a where
  control :: a -> v -> IO ()



-- instances


-- * Environment variables 

newtype Env = Env String

lookupEnv' :: Env -> IO (Maybe String)
lookupEnv' (Env s) = E.lookupEnv s

instance Observable Env where
  observe = lookupEnv'





-- * Files
