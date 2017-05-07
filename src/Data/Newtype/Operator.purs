module Data.Newtype.Operator
  ( flipMapUnwrap
  , (^)
  ) where

import Data.Newtype (class Newtype, unwrap)

flipMapUnwrap :: forall n t a. Newtype n t => n -> (t -> a) -> a
flipMapUnwrap n f = f (unwrap n)

infixl 8 flipMapUnwrap as ^
