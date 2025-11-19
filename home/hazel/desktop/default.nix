{
  inputs,
  lib,
  pkgs,
  ...
}: {
  # Import used desktop configuration
  imports = [
    # Display Settings
    #./gnome
    ./hyprland
    #./niri

    # Additional packages for desktop & cli
    ./packages.nix
    ./../extra-packages.nix
  ];
}
