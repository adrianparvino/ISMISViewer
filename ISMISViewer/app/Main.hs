module Main where

import Control.Concurrent
import Control.Monad (void)

import Graphics.UI.Gtk
import Graphics.UI.Gtk.WebKit.WebView
import Graphics.UI.Gtk.Windows.Window

import Text.Blaze.Html.Renderer.String

import qualified Login.HTML as Login

setContent :: WebView -> String -> IO ()
setContent webview html = webViewLoadString webview html Nothing ""

main :: IO ()
main = do
    -- Initialize the GUI
    void initGUI

    -- Create the widgets
    window <- windowNew
    scrolled <- scrolledWindowNew Nothing Nothing
    webview <- webViewNew

    -- Set widgets default attributes
    window `set` [ windowTitle          := "ISMIS Viewer"
                 , windowResizable      := True
                 , windowWindowPosition := WinPosCenter
                 , windowDefaultWidth   := 1280
                 , windowDefaultHeight  := 720
                 , containerChild       := scrolled ]

    scrolled `set` [ containerChild := webview ]

    setContent webview (renderHtml Login.page)

    -- Start the GUI main loop
    widgetShowAll window
    mainGUI
