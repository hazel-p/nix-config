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
