{
  config,
  pkgs,
  ...
}: let
  /*
  amdgpu-kernel-module = pkgs.callPackage ./packages/amdgpu-kernel-module.nix {
    # Make sure the module targets the same kernel as your system is using.
    kernel = config.boot.kernelPackages.kernel;
  };

  # linuxPackages_latest 6.13
  amdgpu-stability-patch = pkgs.fetchpatch {
    name = "amdgpu-stability-patch";
    url = "https://github.com/torvalds/linux/compare/ffd294d346d185b70e28b1a28abe367bbfe53c04...SeryogaBrigada:linux:4c55a12d64d769f925ef049dd6a92166f7841453.diff";
    hash = "sha256-q/gWUPmKHFBHp7V15BW4ixfUn1kaeJhgDs0okeOGG9c=";
  };
  */
in {
  # AMD GPU settings
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  environment.systemPackages = with pkgs; [lact];
  systemd.packages = with pkgs; [lact];
  systemd.services.lactd.wantedBy = ["multi-user.target"];

  /*
  # Patch AMD GPU instability with context switching between compute and graphics
  # https://bbs.archlinux.org/viewtopic.php?id=301798
  # side-effects: plymouth fails to show at boot, but does not interfere with booting
  boot.extraModulePackages = [
    (amdgpu-kernel-module.overrideAttrs (_: {
      patches = [
        amdgpu-stability-patch
      ];
    }))
  ];
  */
}
