{ inputs, outputs, config, pkgs, ... }:

{
  imports =
    [ 
      inputs.home-manager.nixosModules.home-manager

      ./hardware-configuration.nix

      # TODO: OTHER IMPORTS
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "ms1-hzl4"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hazel = {
    isNormalUser = true;
    description = "Hazel - Server Admin";
    extraGroups = [ "networkmanager" "wheel" ];
    initialPassword = "secure-me!";
  };
  services.getty.autologinUser = "hazel";

  # List packages installed in system profile. 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    git
    neovim 
    wget
    kitty
    htop
    neofetch
  ];

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
    };
    openFirewall = true;
  };
  
  

  #TODO: Nextcloud

  networking = {
    firewall.enable = true;
    networkmanager.enable = true;
  };

  system.stateVersion = "24.05"; # Did you read the comment?
}
