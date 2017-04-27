{-# LANGUAGE OverloadedStrings #-}
module Login.HTML where

import Text.Blaze.Html5
import Text.Blaze.Html5.Attributes hiding (label, style, span)
-- import Paths_ISMISViewer (version)
import Data.Version (showVersion)
import Web.FontAwesomeType
import Data.Monoid

import Prelude hiding (id, div, head, span)

import Login.CSS

page :: Html
page = docTypeHtml $ do
  head $ do
    -- link ! href "https://fonts.googleapis.com/css?family=Pacifico" ! rel "stylesheet"
    -- script ! src "https://use.fontawesome.com/bc68209d19.js" $ return ()
    style ! type_ "text/css" $ string css
  body $ do
    div ! id "input-container" $ do
      header . string $ unwords ["ISMISViewer"]
      div $ input ! type_ "text" ! placeholder "Username / ID Number"
      div $ input ! type_ "text" ! placeholder "Password"
      div . button . span $ string "Login"
