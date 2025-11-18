{
  inputs,
  lib,
  pkgs,
  ...
}: {
  # Import used desktop configuration
  imports = [
    ./waybar.nix
    ./rofi.nix
    ./swww.nix
  ];

  # Import wayland apps
  home.packages = with pkgs; [
  ];
}
