{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Concurrent
import Control.Monad (void)

import Graphics.UI.Gtk hiding (get)
import Graphics.UI.Gtk.WebKit.WebView
import Graphics.UI.Gtk.Windows.Window

import Text.Blaze.Html.Renderer.String

import Control.Monad
import Control.Monad.IO.Class

import qualified Data.Text as T
import Data.Text.Encoding

import Web.Spock
import Web.Spock.Config
import Network.Mime

import Control.Concurrent

import qualified Login.HTML as Login

setContent :: WebView -> String -> IO ()
setContent webview html = webViewLoadString webview html Nothing ""

main :: IO ()
main = do
  void . forkIO $ spockThread
  -- Initialize the GUI
  void initGUI

  -- Create the widgets
  window <- windowNew
  scrolled <- scrolledWindowNew Nothing Nothing
  webview <- webViewNew

  -- Set widgets default attributes
  window `set` [ windowTitle          := ("ISMIS Viewer" :: String)
               , windowResizable      := True
               , windowWindowPosition := WinPosCenter
               , windowDefaultWidth   := 1280
               , windowDefaultHeight  := 720
               , containerChild       := scrolled ]

  scrolled `set` [ containerChild := webview ]

  webViewLoadUri webview ("http://localhost:8080" :: String)

  -- Start the GUI main loop
  widgetShowAll window
  mainGUI

spockThread :: IO ()
spockThread = do
  spockCfg <- defaultSpockCfg Nothing PCNoDatabase Nothing
  runSpock 8080 $ spock spockCfg (system)

system :: SpockM conn sess st ()
system = do
    get root $ do
      redirect "./index.html"
    get "index.html" $ do
      html "<html> <head> <script src=\"static/all.js\"></script> </head> </html>"
    get ("static" <//> var) $ \x -> do
      liftIO $ print x
      file =<< (decodeUtf8 . defaultMimeLookup . T.pack) $ "static/" ++ x
    -- liftIO $ putMVar m ()
