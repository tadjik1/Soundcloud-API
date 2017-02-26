{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TypeOperators #-}

module ItemsAPI (
  ItemsAPITypeLevel,
  itemsAPIValueLevel
) where

import           Servant
import           Control.Monad.Trans.Except

import qualified Models

type ItemsAPITypeLevel =
  "item" :> Get '[JSON] [Models.Item] :<|>
  "item" :> Capture "itemId" Integer :> Get '[JSON] Models.Item

itemsAPIValueLevel :: Server ItemsAPITypeLevel
itemsAPIValueLevel =
  getItems :<|>
  getItemById

getItems :: Handler [Models.Item]
getItems = return [exampleItem]

getItemById :: Integer -> Handler Models.Item
getItemById = \ case
  0 -> return exampleItem
  _ -> throwE err404

exampleItem :: Models.Item
exampleItem = Models.Item 0 "example item"
