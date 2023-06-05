module Vars where

import Colors
import XMonad
import XMonad.Prompt
import XMonad.Actions.DynamicProjects

myTerminal :: String
myTerminal = "kitty"

promptConfig :: XPConfig
promptConfig = def {
    font = "-adobe-helvetica-medium-r-normal-*-*-100-*-*-*-*-*-*",
    bgColor = color1,
    fgColor = "#FFFFFF",
    bgHLight = color2,
    fgHLight = "#000000",
    borderColor = color2,
    promptBorderWidth = 2
}

projects :: [Project]
projects = [
    Project { projectName = "scratch"
            , projectDirectory = "~/"
            , projectStartHook = Just $ do spawn "kitty"
    }, Project { projectName = "web"
            , projectDirectory = "~/Downloads/"
            , projectStartHook = Just $ do spawn "brave-bin"
    }, Project { projectName = "gaming"
            , projectDirectory = "~/"
            , projectStartHook = Just $ do spawn "steam"
                                           spawn "lutris"
                                           spawn "heroic"
    }, Project { projectName = "social"
            , projectDirectory = "~/"
            , projectStartHook = Just $ do spawn "slack"
                                           spawn "discord-screenaudio"
    }, Project { projectName = "dev"
            , projectDirectory = "~/Git/"
            , projectStartHook = Just $ do spawn "qgit"
                                           spawn "code"
    }
    ]

names :: [WorkspaceId]
names = map projectName projects
