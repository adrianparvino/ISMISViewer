{-# LANGUAGE OverloadedStrings #-}
module Login.HTML where

import Text.Blaze.Html5
import Text.Blaze.Html5.Attributes hiding (label, style)
-- import Paths_ISMISViewer (version)
import Data.Version (showVersion)
import Web.FontAwesomeType
import Data.Monoid

import Prelude hiding (id, div, head)

import Login.CSS

page :: Html
page = docTypeHtml $ do
  head $ do
    script ! src "https://use.fontawesome.com/bc68209d19.js" $ return ()
    style ! type_ "text/css" $ string css
  body $ do
    div ! id "input-container" $ do
      header . string $ unwords ["ISMISViewer"]
      div ! id "username" $ do
        input ! type_ "text" ! placeholder "Username / ID Number"
      div ! id "password" $ do
        input ! type_ "text" ! placeholder "Password"
