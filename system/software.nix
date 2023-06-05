{ config, pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
   brave
   vscode-fhs
   kmenuedit
   arduino
   git
   mlocate
   steam
   lutris
   protonup-qt
   heroic
   steam-run
 ];
} 
