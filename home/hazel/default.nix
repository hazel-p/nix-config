{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.impermanence.homeManagerModules.impermanence
    ./packages.nix
    ./cli
  ];

  home = {
    username = "hazel";
    homeDirectory = "/home/hazel";
    stateVersion = "24.11";
    sessionPath = ["$HOME/.local/bin"];
    sessionVariables.NH_FLAKE = "$HOME/Documents/NixConfig";

    persistence = {
      "/persist".directories = [
        "Documents"
        "Downloads"
        "Pictures"
        "Videos"
        ".local/bin"
        ".local/share/nix" # trusted settings and repl history
      ];
    };
  };

  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.droid-sans-mono
  ];
}
