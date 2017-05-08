-- | This extremely tiny library provides a way to easily access deeply nested
-- | newtypes without lens.

-- | For example, `book^_.author^_.birthplace^_.location.lon`
-- | Look inside `test/Main.purs` for a more elaborate example.
module Data.Newtype.Operator
  ( flipMapUnwrap
  , (^)
  ) where

import Data.Newtype (class Newtype, unwrap)

flipMapUnwrap :: forall n t a. Newtype n t => n -> (t -> a) -> a
flipMapUnwrap n f = f (unwrap n)

infixl 8 flipMapUnwrap as ^
