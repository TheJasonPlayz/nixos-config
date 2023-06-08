{ config, pkgs, ... }:

{
 hardware.opengl = {
   enable = true;
   driSupport = true;
   driSupport32Bit = true;
 };

 hardware.bluetooth = {
   enable = true;
   powerOnBoot = true;
 };

 hardware.xpadneo.enable = true;
 hardware.xone.enable = true;

 environment.systemPackages = [ pkgs.mesa ];

 services.xserver.videoDrivers = [ "amdgpu" ]; 
}
