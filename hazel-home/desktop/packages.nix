{
  inputs,
  lib,
  pkgs,
  ...
}: {
  # Desktop and GUI Packages
  programs.librewolf.enable = true;
  home.packages = with pkgs; [
    # Art & Music
    audacity
    reaper
    krita

    # Multimedia
    webcord-vencord
    prismlauncher

    # UI Productivity
    obsidian
    libreoffice-qt
    texstudio
    zathura
  ];
}
