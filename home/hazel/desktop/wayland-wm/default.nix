{
  inputs,
  lib,
  pkgs,
  ...
}: {
  # Import used desktop configuration
  imports = [
    ./waybar
  ];

  # Import wayland apps
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
