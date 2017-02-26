{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TypeOperators #-}

module API (mkApp, API) where

import           Servant

import           ItemsAPI

type API =
  ItemsAPITypeLevel

server :: Server API
server =
  itemsAPIValueLevel

mkApp :: IO Application
mkApp = return $ serve (Proxy :: Proxy API) server
