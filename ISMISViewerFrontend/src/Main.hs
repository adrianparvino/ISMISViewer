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

import Reflex
import Reflex.Dom
import qualified Data.Map as Map
import Safe (readMay)
import Control.Applicative ((<*>), (<$>))

main = mainWidget $ el "div" $ do
  nx <- numberInput
  text " + "
  ny <- numberInput
  text " = "
  result <- combineDyn (\x y -> (+) <$> x <*> y) nx ny
  resultString <- mapDyn show result
  dynText resultString

numberInput :: MonadWidget t m => m (Dynamic t (Maybe Double))
numberInput = do
  n <- textInput $ def & textInputConfig_inputType .~ "number"
                       & textInputConfig_initialValue .~ "0"
  mapDyn readMay $ _textInput_value n
