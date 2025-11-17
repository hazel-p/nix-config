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

  # Using Liqorix and LQX to mitigate freezes on the RX7600
  # https://lists.debian.org/debian-kernel/2025/08/msg00516.html
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_lqx;
  # This issue presents itself on every kernel after and including 6.10
  # downgrading the kernel is another option, but would disable undervolting
  #boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_6
}
