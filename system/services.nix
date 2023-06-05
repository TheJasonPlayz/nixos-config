{ config, pkgs, ... }:

{
 security.rtkit.enable = true;
 services.pipewire = {
   enable = true;
   audio.enable = true;
   pulse.enable = true;
 };

 programs.dconf.enable = true;
 services.dbus = {
   enable = true;
   packages = [ pkgs.dconf ];
 };
}
