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
 
  programs.dconf.enable = true;

  # Enable sharing with home-manager modules
  environment.pathsToLink = ["/share/applications" "/share/xdg-desktop-portal"];

  # Enable pure desktop packages
  programs.steam.enable = true;
}
