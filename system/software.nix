{ config, pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
   brave
   vscode-fhs
   kmenuedit
   arduino
   git
   mlocate
 ];
} 
