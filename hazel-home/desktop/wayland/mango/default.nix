{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./mango.nix
  ];

  home.packages = with pkgs; [
    xdg-desktop-portal-wlr #for screen sharing
    xdg-desktop-portal
    xdg-desktop-portal-gtk
  ];
}
