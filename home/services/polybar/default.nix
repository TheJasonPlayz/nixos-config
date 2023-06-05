{ config, pkgs, ... }:

let
   xmonad = ''
      [module/xmonad]
      type = custom/script
      exec = ${pkgs.xmonad-log}/bin/xmonad-log
     
      tail = true
   '';
in
{
 services.polybar = {
   enable = true;
   config= ./config.ini;
   extraConfig = xmonad + builtins.readFile ./modules.ini;
   package = pkgs.polybar;
   script = ''
      polybar -r xmonad 2>${config.xdg.configHome}/polybar/logs/xmonad.log & disown
   '';
 };
}
