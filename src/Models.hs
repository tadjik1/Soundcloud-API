{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TypeOperators #-}

module Models where

import           GHC.Generics
import           Data.Aeson

-- * item

data Item = Item {
  itemId :: Integer,
  itemText :: String
} deriving (Eq, Show, Generic)

instance ToJSON Item
instance FromJSON Item
