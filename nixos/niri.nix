{
  inputs,
  config,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [inputs.niri.overlays.niri];
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };
  services.displayManager.defaultSession = "niri";
  qt.platformTheme.name = "qt5ct";
  environment.variables.NIXOS_OZONE_WL = "1";
}
