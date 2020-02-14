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

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

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
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  services.chrony.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  # Settings for desktop, display, and window managers.
  services.xserver = {
    enable = true;
    desktopManager = {
      default = "none";
      xterm.enable = false;
    };
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
  system.stateVersion = "19.03"; # Did you read the comment?

  # You'll be free hackers.
  nixpkgs.config.allowUnfree = true;

  # Anduril cache things...
  # Remove me if you're going to commit this to dotfiles repo.
  nix.binaryCaches =
      [ "https://cache.nixos.org/"
        "https://s3-us-west-2.amazonaws.com/anduril-nix-cache"
      ];
  nix.binaryCachePublicKeys =
      [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "anduril-nix-cache:0FYOuMqEzbSX2PmByfePpJAsSV6CW+1YWoq7b21NxHc="
      ];

}
