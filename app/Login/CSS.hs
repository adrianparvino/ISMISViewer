{-# LANGUAGE OverloadedStrings #-}
module Login.CSS where

import qualified Data.Text.Lazy as T
import Clay
import qualified Clay.Flexbox as F

import Prelude hiding (div)

h = 360
w = 360

css :: String
css = T.unpack . render $ do
  html ? boxSizing borderBox

  star ? boxSizing inherit
  star # before ? boxSizing inherit
  star # after  ? boxSizing inherit

  star ? boxSizing inherit
  body ? do
    backgroundColor darkgreen
  "#input-container" ? do
    display $ flex
    flexDirection $ column

    left $ pct 50
    top  $ pct 50

    height $ px h
    width  $ px w

    marginTop  $ px $ -h/2
    marginLeft $ px $ -w/2

    border none (px 0) white
    sym padding none

    position fixed

    header <? do
      fontFamily ["Overpass"] [serif]
      fontSize $ px 40
      fontWeight bold
      color white

    star <? do
      flexGrow 1
      textAlign . alignSide $ sideCenter

    star ? do
      display $ flex

    input ? do
      width (pct 100)
    button ? width (pct 100)
