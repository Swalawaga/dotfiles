#Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  nixpkgs.config.allowUnfree = true;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  networking.networkmanager.enable = true;

  networking.hostName = "swalawaga"; # Define your hostname.
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  #Nvidia
  #services.xserver.videoDrivers = [ "nvidia" ];
#
#  hardware.nvidia.prime = {
#    sync.enable = true;
#    nvidiaBusId = "PCI:1:0:0";
#    intelBusId = "PCI:5:0:0";
#  };
   
  services.xserver = {
    enable = true;
    layout = "us";
    #touchpad settings
    libinput.enable = true;
    libinput.touchpad.naturalScrolling = true;
    libinput.touchpad.middleEmulation = false;
    libinput.touchpad.tapping = true;
    libinput.touchpad.clickMethod = "clickfinger";
    libinput.touchpad.horizontalScrolling = false;
    libinput.touchpad.disableWhileTyping = true;
    # Enable the KDE Desktop Environment.
    #displayManager.sddm.enable = true;
    #desktopManager.plasma5.enable = true;
    #desktopManager.xfce.enable = true;
    #enable gnome
    #displayManager.gdm.enable = true;
    #desktopManager.gnome.enable = true;
    #i3 settings
    desktopManager = {
        xterm.enable = false;
    };
    displayManager = {
        defaultSession = "none+i3";
    };
    displayManager.lightdm = {
        enable = true;
    };
    windowManager.i3.enable = true;
    windowManager.i3.package = pkgs.i3-gaps;
  };


  xdg.portal.enable = true;
  programs.dconf.enable = true;
  services.printing.enable = true;
  #flatpak
  services.flatpak.enable = true;
  programs.steam.enable = true;
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  programs.zsh.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.swalawaga = {
   isNormalUser = true;
   shell = pkgs.zsh; #makes zsh the default shell for swalawaga
   extraGroups = [ "wheel"]; # Enable ‘sudo’ for the user.
  };

  environment = {
  variables.EDITOR = "nvim";
  pathsToLink = [ "/libexec" ];
  systemPackages = with pkgs; [
    vim 
    wget
    curl
    neovim
    tmux
    neofetch
    nodejs
    git
    lxappearance
    python
    firefox
    dmenu
    rofi
    wofi
    wirelesstools
    i3status
    networkmanagerapplet
    (steam.override {nativeOnly = false; extraPkgs = pkgs: [ mono gtk3 gtk3-x11 libgdiplus zlib ];})
    kitty
    pywal
    tty-clock
    conky
    dunst
    xorg.xbacklight
    #libsForQt5.discover use w/ kde
    zsh
    exa
    discord
    minecraft
    unzip
    google-chrome
    pywal
    links
    #gnome.gnome-tweaks
  ];
  };
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh.enable = true;
  
  system.stateVersion = "21.05";

}
