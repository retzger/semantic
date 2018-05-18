module Data.Abstract.Name
( Name
, name
, unName
) where

import qualified Data.ByteString.Char8 as BC
import           Data.String
import           Prologue

-- | The type of variable names.
data Name
  = Name ByteString
  | I Int
  deriving (Eq, Ord)

name :: ByteString -> Name
name = Name

unName :: Name -> ByteString
unName (Name name) = name
unName (I i)       = BC.pack (show i)

instance IsString Name where
  fromString = Name . BC.pack

instance Show Name where
  showsPrec d = showsPrec d . unName

instance Hashable Name where
  hashWithSalt = hashUsing unName
