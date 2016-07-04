module System.Declarative where


import System.Declarative.Observe

import qualified System.Environment as E



-- * LAWS :
-- -- Strict consistency : 
-- control s v >> observe s == v
-- observe s >>= control s == idM


-- | Observable: what state is an entity in?
class Observable a where
  observe :: a -> IO (Maybe String)


-- | Controllable: force an entity into a given state
class Controllable a where
  control :: a -> v -> IO ()


-- | Assertable: is the entity in a given state ?
class Assertable a where
  assert :: a -> v -> IO Bool





-- instances


-- * Environment variables 

newtype Env = Env String

lookupEnv' :: Env -> IO (Maybe String)
lookupEnv' (Env s) = E.lookupEnv s

instance Observable Env where
  observe = lookupEnv'





-- * Files

newtype Path = Path FilePath
