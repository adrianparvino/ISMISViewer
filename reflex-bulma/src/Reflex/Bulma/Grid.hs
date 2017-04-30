{-# LANGUAGE DataKinds, OverloadedStrings #-}
module Reflex.Bulma.Grid
  ( columns
  ) where

import Reflex
import Reflex.Dom
import Reflex.Dom.Widget

import Data.Monoid

import Control.Monad.Fix

import Data.HVect

import Data.Text (Text)
import qualified Data.Text as T

-- TODO: Try to make this use heterogenous lists.
columns :: MonadWidget t m => [Text] -> [([Text], [a] -> m a)] -> m [a]
columns classes ms = divClass (T.unwords $ "columns":classes) $
                     columns_ (fmap (\(classes, m) -> divClass (T.unwords $ "column":classes) . m) ms)
  where
     columns_ ms = mfix (\xs -> traverse ($ xs) ms)
