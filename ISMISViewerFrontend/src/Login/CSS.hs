{-# LANGUAGE OverloadedStrings #-}
module Login.CSS where

import qualified Data.Text as T
import Clay
import Clay.Size
import Web.FontAwesomeType
import qualified Clay.Flexbox as F

import Prelude hiding (div)

h = 360
w = 360

css :: Css
css = do
  html ? boxSizing borderBox

  star ? boxSizing inherit
  star # before ? boxSizing inherit
  star # after  ? boxSizing inherit

  star ? boxSizing inherit
  body ? do
    backgroundColor darkgreen
  "#login" ? do

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
      textAlign . alignSide $ sideCenter

    let rowCss = width (pct 100)
    ".row" ? rowCss
    ".input-row" ? do
      rowCss
      i <? width (px 20)
      input <? width (pct 100 @-@ px 20)

    button ? width (pct 100)

    ".username" # before ? do
      display block
      fontFamily ["FontAwesome"] []
      width (px 16)
      content . stringContent . T.singleton . fontAwesomeChar $ FaUser
    ".password" # before ? do
      display block
      fontFamily ["FontAwesome"] []
      width (px 16)
      content . stringContent . T.singleton . fontAwesomeChar $ FaKey
