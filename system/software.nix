{ config, pkgs, ... }:

let
   development = with pkgs; [
     vscode
     arduino
     git
     super-slicer-latest
     printrun
   ];
   gaming = with pkgs; [
     minecraft    
     goverlay 
     mangohud
     lutris
     protonup-qt
     heroic
  ];
  deps = with pkgs; [
    yad
    winePackages.minimal
    unzip
    xdotool
    xxd 
    xorg.xwininfo
    bluez-alsa
    arc-theme
  ];
  apps = with pkgs; [
    pavucontrol 
    brave
    paprefs
    krita
    gimp
    blueberry
    discord
    kmenuedit
    lxappearance
  ];
  utils = with pkgs; [
    steam-run  
    mlocate
    wget
    bluez-tools
    killall
    alsa-utils
    usbutils
    fontpreview
    neofetch
  ];
in
{
 environment.systemPackages = development ++ gaming ++ deps ++ apps ++ utils;
} 
