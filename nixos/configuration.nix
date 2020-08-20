# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, options, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Add Google timeservers
  networking.timeServers = options.networking.timeServers.default ++ [ "time.google.com" ];

  # Set your time zone.
  time.timeZone = "UnitedStates/LosAngeles";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    vim 				# Default Text Editor
    git					# Source Control
    emacs 				# Extra Text Editor
    alacritty 				# Default Terminal Emulator
    unzip 				# .zip file utility
    xclip				# COPY/PASTE utility
    arandr				# GUI for xrandr
    scrot 				# Screen Locker
    fish				# Default Shell
    jetbrains.clion 			# C/C++/Crust IDE
    htop                                # Don't be a peasant
  ];

  # Apply xkb settings outside of X11
  # https://unix.stackexchange.com/questions/377600/in-nixos-how-to-remap-caps-lock-to-control
  i18n.consoleUseXkbConfig = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Use chrony to keep your clocks up to date with networking.timeServers
  services.chrony.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable the X11 windowing system.
  # Settings for desktop, display, and window managers.
  services.xserver = {
    enable = true;
    desktopManager = {
      default = "none";
      xterm.enable = false;
    };
    xkbOptions = "caps:swapescape";
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [ dmenu
				   i3status
				   i3lock
				   i3blocks
 			         ];
    };
    videoDrivers = [ "nvidia" ];
  };

  # Enable fish as default shell
  programs.fish.enable = true;

  # User Account(s)
  users.users.skamdart = {
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "20.03"; # Did you read the comment?

  # You'll be free hackers.
  nixpkgs.config.allowUnfree = true;
}
