{-# LANGUAGE RankNTypes, DataKinds, OverloadedStrings #-}
module Reflex.Bulma.Grid
  ( columns
  ) where

import Reflex
import Reflex.Dom
import Reflex.Dom.Widget

import Data.Monoid

import Control.Monad.Fix

import Data.Text (Text)
import qualified Data.Text as T

columns :: MonadWidget t m => [Text] -> (forall a. ([Text] -> m b -> m (a, b)) -> m (a, b)) -> m b
columns classes m = divClass (T.unwords $ "columns":classes) . fmap snd $ m column
  where
    column :: MonadWidget t m => [Text] -> m b -> m (a, b)
    column classes inner = (,) undefined <$> divClass (T.unwords $ "column":classes) inner
