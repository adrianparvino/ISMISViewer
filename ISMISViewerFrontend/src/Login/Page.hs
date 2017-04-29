{-# LANGUAGE OverloadedStrings #-}
module Login.Page where

import Reflex
import Reflex.Dom
import Reflex.Dom.Widget.Input

-- import Paths_ISMISViewer (version)
import Data.Version (showVersion)
import Data.Monoid

import Web.FontAwesomeType

import Prelude hiding (id, div, head, span)

page :: MonadWidget t m => m ()
page = elAttr "div" ("id" =: "login") $ do
  el "header" . text $ "ISMISViewer"
  divClass "input-row" $ do
    elClass "i" ("fa " <> fontAwesomeClass FaUser) $ return ()
    textInput (def & textInputConfig_attributes .~ (return $ "placeholder" =: "Username"))
  divClass "input-row" $ do
    elClass "i" ("fa " <> fontAwesomeClass FaKey) $ return ()
    textInput (def & textInputConfig_attributes .~ (return $ "placeholder" =: "Password"))
  divClass "row" . button $ "Login"

  return ()
