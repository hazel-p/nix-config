{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  # Essential System-wide Packages
  environment.systemPackages = with pkgs; [
    git
    neovim
    memtester

    #for installing chromebook stuff
    clang
    debootstrap
    parted
    gnumake
  ];

  # Localisation
  time.timeZone = "Europe/London";
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
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };
  console.keyMap = "uk";

  # Nix
  nixpkgs.config.allowUnfree = true;
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  # Configure Sops
  sops = {
    defaultSopsFile = ./../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/hazel/.config/sops/age/keys.txt";
    secrets."user-password".neededForUsers = true;
    secrets."user-password" = {};
    # inspo: https://github.com/Mic92/sops-nix/issues/427
    gnupg.sshKeyPaths = [];
  };

  # Add personal user account
  # users.mutableUsers = false;
  users.users.hazel = {
    isNormalUser = true;
    description = "Hazel P";
    extraGroups = ["networkmanager" "wheel"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHUW/Z5paE3aBdN6qFshFs/dopVA2w5aMqNPy6ndeRLh" # desktop
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMGbwlt08duYdR/PY93ANEIWbV4GJmp7GxkGq97srpgc" # elitebook

    ];
    shell = pkgs.zsh;
    hashedPasswordFile = config.sops.secrets."user-password".path;
  };
  programs.zsh.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
    openFirewall = true;
  };
  services.fstrim.enable = true;

  networking = {
    firewall.enable = true;
    networkmanager.enable = true;
  };

  system.stateVersion = "24.11"; #Don't change
}
