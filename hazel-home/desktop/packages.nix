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
    stremio-linux-shell

    # Modding
    unstablePkgs.intiface-central

    # Multimedia
    legcord
    prismlauncher

    # UI Productivity
    obsidian
    libreoffice-qt
    texstudio
    zathura
  ];
}
