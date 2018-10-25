import Graphics.X11.ExtraTypes.XF86
import XMonad
-- import XMonad.Actions.Volume(raiseVolume,lowerVolume,toggleMute)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Util.Run(runInTerm)
import XMonad.Util.EZConfig(additionalKeys)

-- General configuration
myModMask   = mod4Mask
myTerminal  = "termite"
myEditor    = "emacs"

-- Key mappings
myKeys :: [((ButtonMask, KeySym), X ())]
myKeys = [
    -- Power off the system (mod+ctrl+<)
    ((myModMask .|. controlMask, xK_less), spawn "poweroff")
    -- Reboot the system (mod+shift+<)
    , ((myModMask .|. shiftMask, xK_less), spawn "reboot")

    -- Suspend the system to RAM (special Fn key "Launch 3")
    -- You need to be in 'power' group and to put this on sudoers:
    --   %power ALL = NOPASSWD: /usr/sbin/pm-suspend
    , ((0, xF86XK_Launch3), spawn "sudo pm-suspend")

    -- Lock screensaver (mod+ctrl+l)
    , ((myModMask .|. controlMask, xK_l), spawn "xscreensaver-command -lock")

    -- Edit XMonad configuration in new terminal (mod+x)
    , ((myModMask, xK_x), runInTerm "-title 'XMonad config editor'" $
        "sh -c '" ++ myEditor ++ " ~/.xmonad/xmonad.hs'")

    -- Audio Fn keys
--    , ((0, xF86XK_AudioRaiseVolume), raiseVolume 8 >> return ())
--    , ((0, xF86XK_AudioLowerVolume), lowerVolume 8 >> return ())
--    , ((0, xF86XK_AudioMute),        toggleMute    >> return ())

    -- Brightness Fn keys
    , ((0, xF86XK_MonBrightnessUp), spawn
        "xbacklight -inc 20 -time 0 -steps 1")
    , ((0, xF86XK_MonBrightnessDown), spawn
        "xbacklight -dec 20 -time 0 -steps 1")

    -- Keyboard backlight
--    , ((0, xF86XK_KbdBrightnessUp), spawn "xbacklight +20")
--    , ((0, xF86XK_KbdBrightnessDown), spawn "xbacklight -20")

    -- Screenshots
    , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
    , ((0, xK_Print), spawn "scrot")
    ]

-- Status bar
myBar = "xmobar"
myPP = xmobarPP
    { ppSep = " <fc=blue>·</fc> "
    , ppTitle = xmobarColor "orange" "" . shorten 55
    }
toggleStrutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)
myConfig = defaultConfig
    { terminal      = myTerminal
    , layoutHook    = avoidStruts . smartBorders . layoutHook $ defaultConfig
    , manageHook    = manageDocks <+>  manageHook defaultConfig
    , handleEventHook   = fullscreenEventHook
    , modMask               = myModMask
    , normalBorderColor     = "#444444"
    , focusedBorderColor    = "#AAAAAA"
    } `additionalKeys` myKeys

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig
