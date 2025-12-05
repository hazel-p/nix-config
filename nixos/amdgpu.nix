{
  config,
  pkgs,
  lib,
  ...
}: {
  # AMD GPU settings
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  environment.systemPackages = with pkgs; [lact];
  systemd.packages = with pkgs; [lact];
  systemd.services.lactd.wantedBy = ["multi-user.target"];

  # Currently using Liqorix kernel, which may help with crashes
  # Using downgraded LTS kernel mitigate crashing, but will also disable undervolting
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_6;
}
