-- | This example module defines a nested newtype and shows how to access it

module Test.Main (main) where

import Prelude
import Control.Monad.Eff (Eff)
import Data.Newtype (class Newtype)
import Data.Newtype.Operator ((^))

newtype Book = Book
  { name :: String
  , author :: Author
  }

derive instance bookNewtype :: Newtype Book _

newtype Author = Author
  { name :: String
  , birthplace :: City
  }

derive instance authorNewtype :: Newtype Author _

newtype City = City
  { name :: String
  , location :: Location
  }

derive instance cityNewtype :: Newtype City _

-- | Just as an example we make the last field a normal rows type.
-- | Pay attention that normal rows types are accessed using the dot operator
-- | like `location.la` or `location.lon` and only newtypes use the `^` operator.
-- |
-- | `newtype Location = Location { la :: Int, lon :: Int}`  would be accessed
-- | like `location^_.la` or `location^_.lon` respectively.
type Location =
 { la :: Int
 , lon :: Int
 }

main :: Eff _ Unit
main = do
  -- | We defined a nested newtype
  let book = Book
        { name: "The Big Short: Inside The Doomsday Machine"
	, author: Author
            { name: "Michael Lewis"
	    , birthplace: City
                { name: "New Orleans"
                , location:
		    { la: 29
                    , lon: -90
                    }
		}
	    }
	}
      -- | And access some deeply nested field
      longitude = book^_.author^_.birthplace^_.location.lon
  pure unit
