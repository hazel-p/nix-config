{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./hyprland.nix
  ];
  # Initial inspiration from github.com/weatflac505/hyprland-config-with-home-manager
  # Functional inspiration from github.com/Misterio77/nix-config

  home.packages = with pkgs; [
    hyprpicker # color picker from your screen
    hypridle # idle management  daemon
    hyprlock # screen locker
    xdg-desktop-portal-hyprland # lets other applications communicate with the compositor through D-Bus
    hyprsunset # blue light filter, undetected in screenshots
    hyprpolkitagent # polkit authentication daemon, allows GUI applications for elevated permissions
    hyprsysteminfo # GUI application that displays system information
    hyprland-qt-support # provides QML style for hypr*qt6 apps
    #hyprcursor # new cursor theme format
    hyprutils # library providing shared implementations of commonly used types across the hypr* ecosystem
    hyprlang # library provides parsing of the hypr configuration language
    hyprwayland-scanner # hw-s,is a utility to generate sources and headers for wayalnd protocol specifications (generates c++ implementations)
    aquamarine # lightweight linux rendering backend library
    hyprgraphics # library providing shared implementations of utilities related to graphics and resources, like loading images or color calculations
    hyprland-qtutils # small bunch of utility applications that hyprland might invoke (stuffs like dialogs and popups)
  ];
}
