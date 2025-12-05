{
  inputs,
  lib,
  pkgs,
  ...
}: {
  # Desktop and GUI Packages
  programs.firefox.enable = true;
  home.packages = with pkgs; [
    # Art & Music
    amberol
    spotify
    audacity
    reaper
    krita

    # Multimedia
    discord
    prismlauncher

    # UI Productivity
    obsidian
    libreoffice-qt
    texstudio
    zathura
  ];
}
