-- | This file is part of MySC.
-- |
-- | MySC is free software: you can redistribute it and/or modify
-- | it under the terms of the GNU General Public License as published by
-- | the Free Software Foundation, either version 3 of the License, or
-- | (at your option) any later version.
-- |
-- | MySC is distributed in the hope that it will be useful,
-- | but WITHOUT ANY WARRANTY; without even the implied warranty of
-- | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- | GNU General Public License for more details.
-- |
-- | You should have received a copy of the GNU General Public License
-- | along with MySC.  If not, see <http://www.gnu.org/licenses/>.

{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Main where

import Reflex.Dom
import Data.Text.Lazy (toStrict)
import Data.Monoid

import qualified Login.CSS as Login
import qualified Login.Page as Login

import Clay (render)

main :: IO ()
main = mainWidgetWithHead headWidget $ Login.page

headWidget :: MonadWidget t m => m ()
headWidget = do
  -- el "style" . text . toStrict . render $ Login.css
  elAttr "link" ("href" =: "https://fonts.googleapis.com/css?family=Pacifico" <> "rel" =: "stylesheet") $ return ()
  elAttr "link" ("href" =: "https://cdnjs.cloudflare.com/ajax/libs/bulma/0.4.1/css/bulma.min.css" <> "rel" =: "stylesheet") $ return ()
  elAttr "script" ("src" =: "https://use.fontawesome.com/bc68209d19.js") $ return ()
