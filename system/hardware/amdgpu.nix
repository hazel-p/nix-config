{
  config,
  pkgs,
  lib,
  ...
}: {
  # AMD GPU settings
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  services.lact.enable = true;
  hardware.amdgpu.overdrive.enable = true;

  # Currently using Liqorix kernel, which may help with crashes
  # Using downgraded LTS kernel makes crashing less common, but also disables undervolting
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_6;
}
