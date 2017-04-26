{-# LANGUAGE OverloadedStrings #-}
module Login.CSS where

import qualified Data.Text.Lazy as T
import Clay

import Prelude hiding (div)

h = 360
w = 360

css :: String
css = T.unpack . render $ do
  "#input-container" ? do
    left $ pct 50
    top  $ pct 50

    height $ px h
    width  $ px w

    marginTop  $ px $ -h/2
    marginLeft $ px $ -w/2

    position fixed

    star <? do
      sym padding (px 20)
    star ? do
      position relative
      textAlign . alignSide $ sideCenter
