 { config, pkgs, ... }:

{
 services.xserver = {
   enable = true;
   
   displayManager.lightdm = {
     enable = true;
   };

   windowManager.xmonad = {
     enable = true;
     enableContribAndExtras = true;
   };
 };
}
