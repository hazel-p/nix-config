{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
    ./packages.nix
    ./cli
  ];

  home = {
    username = "hazel";
    homeDirectory = "/home/hazel";
    stateVersion = "24.11";
  };

  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.droid-sans-mono
  ];
}
