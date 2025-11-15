{
  inputs,
  lib,
  pkgs,
  ...
}: {
  # Import used desktop configuration
  imports = [
<<<<<<< HEAD:home/hazel/desktop/default.nix
    #./gnome
    ./hyprland
=======
    ./gnome.nix 
    ./hyprland.nix
>>>>>>> f1a2d3aaafef16fb42869add34b11c1ccc9cbc0d:home/hazel/desktop.nix
  ];

  # Import used desktop apps
  programs.firefox.enable = true;
  home.packages = with pkgs; [
    spotify
    reaper
    discord
    stremio
    prismlauncher
    obsidian
    libreoffice-qt
    hunspell
    texstudio
    texlive.combined.scheme-full
    pandoc
  ];
}
