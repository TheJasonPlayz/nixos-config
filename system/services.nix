{ config, pkgs, ... }:

{
 security.rtkit.enable = true;
 sound.enable = false;
 hardware.pulseaudio.enable = false;
 services.pipewire = {
   enable = true;
   audio.enable = true;
   wireplumber.enable = true;
   alsa = {
     support32Bit = true;
     enable = true;
   };
   pulse.enable = true;
   jack.enable = true;
 };

 programs.dconf.enable = true;
 services.dbus = {
   enable = true;
   packages = [ pkgs.dconf ];
 };
}
