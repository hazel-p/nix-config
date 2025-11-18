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
                swaynotificationcenter # must have notification daemon for smooth hyprland experience (includes pipewire, XDG desktop portal, Authentication agent, Qt wayland support)
    eww # compositor independent to create widgets (alternative:fabric) , I prefer over waybar
    clipse # clipboard manager, stores both text and images, can display in a box (alternative:cliphist)
    wl-clip-persist # solves the problem of copied data getting deleted from clipboard upon closing of applications
    wl-clipboard # required for clipboards in wayland , cli utility for wayland
    udiskie # mounts mass storage devices automatically
    overskride # powerful bluetoothclient in gtk4
    ashell # minimal alternative to nm-applet(wayland native), simple independent window popup, doesn't require a tray
    playerctl # cli tool to control media players
    wldash # a wayland native launcher
    wlogout # manages logout options, exists independently of hyprlock
    fira-code # font to be used
    nwg-look # GTK settings editor, designed to work properly in wlroots-based Wayland environment
  ];
}
