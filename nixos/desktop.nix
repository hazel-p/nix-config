{
  inputs,
  config,
  pkgs,
  lib,
  vars,
  ...
}: {
  # Add desktop environment
  imports = [
    #./gnome.nix
    ./greetd.nix
  ];
  # Using Liqorix and LQX to mitigate freezes on the RX7600
  # https://lists.debian.org/debian-kernel/2025/08/msg00516.html
  # Also mildly improves desktop performance, so worth it for all desktop users.
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_lqx;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Enable pure desktop packages
  programs.steam.enable = true;

  # Persist within home directory
  environment.persistence."/nix/persist" = {
    directories = [
      "/etc/NetworkManager/system-connections"
    ];

    users.${vars.userName} = {
      directories = [
        "Desktop"
        "Documents"
        "Downloads"
        "Music"
        "Pictures"
        "Videos"

        ".cache"
        ".config"
        ".mozilla"
        ".local"
        {
          directory = ".gnupg";
          mode = "0700";
        }
        {
          directory = ".ssh";
          mode = "0700";
        }
      ];
      files = [
        ".zsh_history"
      ];
    };
  };
}
