# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  #Allow unfree packages cause Im not insane
  nixpkgs.config.allowUnfree = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.


  # Set your time zone.
  time.timeZone = "America/New_York";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  #networking.useDHCP = false;
  #networking.interfaces.wlp3s0.useDHCP = true;

  networking.networkmanager.enable = true; 

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.compton.enable = true;
  services.flatpak.enable = true;
  xdg.portal.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver = {
    enable = true;
    layout = "us";
    libinput.enable = true;
    libinput.naturalscrolling = true;
    libinput.middleEmulation = false;
    libinput.tapping = true;
    libinput.clickMethod = "clickfinger";
    libinput.horizontalScrolling = false;
    libinput.disableWhileTyping = true;
    # Enable the KDE Desktop Environment.
    #displayManager.sddm.enable = true;
    # desktopManager.plasma5.enable = true;
    #desktopManager.xfce.enable = true;
    #enable gnome
    #services.xserver.displayManager.gdm.enable = true;
    ##services.xserver.desktopManager.gnome.enable = true;
    displayManager.lightdm.enable = true;
    windowManager.i3.enable = true;


    synaptics = {
      enable = false;
      dev = "/dev/input/event*";
      twoFingerScroll = true;
      tapButtons = false;
      accelFactor = "0.02";
      buttonsMap = [ 1 3 2 ];
      palmDetect = true;
      additionalOptions = ''
        Option "PalmMinWidth" "8"
	Option "PalmMinZ" "1000"
        Option "VertScrollDelta" "-180" # scroll sensitivity, the bigger the negative number = less sensitive
        Option "HorizScrollDelta" "-180"
        Option "FingerLow" "40"
        Option "FingerHigh" "90"
        #Option "Resolution" "270" # Pointer sensitivity, this is for a retina screen, so you'll probably need to change this for an air
      '';
      };
    };

  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.swalawaga = {
   isNormalUser = true;
   extraGroups = [ "wheel" "networkmanager" "audio" "video"]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    vim
    tmux
    neofetch
    nodejs
    python
    firefox
    dmenu
    rofi
    wofi
    wirelesstools
    i3status
    networkmanagerapplet
    (steam.override {nativeOnly = false; extraPkgs = pkgs: [ mono gtk3 gtk3-x11 libgdiplus zlib ];}) 
    synapse 
    home-manager
    #b43Firmware_5_1_138 idk if this is needed I think its important
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}
