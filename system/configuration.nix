# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      <home-manager/nixos>
      ./hardware-configuration.nix #default hardware config
      ./hardware.nix #custom hardware config
      ./services.nix
      ./xserver.nix
      ./software.nix
      ./home/home.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "JASONS_NIXOS"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "America/Denver";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  programs.zsh = {
    enable = true;
    shellInit = ''
       neofetch
    '';
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch";
      xmocomp = "xmonad --recompile && xmonad --restart";
    };
    ohMyZsh = {
      enable = true;
      theme = "eastwood";
      plugins = [
        "git"
        "1password"
      ];
    };
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
  };
  programs.gamemode = {
    enable = true;
    enableRenice = true;
  };

  users.users.jasonw = {
    isNormalUser = true;
    extraGroups = [ "tty" "networkmanager" "wheel" "uucp" "dialout" "mlocate" ];
    shell = pkgs.zsh;
  };

  fonts.fonts = with pkgs; [
    nerdfonts
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
 
  # Recomemended to leave at the release version of first install. For documentation, see https://nixos.org/nixos/options.html
  system.stateVersion = "23.05";
}
