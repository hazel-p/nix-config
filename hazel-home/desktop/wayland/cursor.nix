{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.pointerCursor = {
    #gtk.enable = true;
    #sway.enable = true;
    # x11.enable = true;
    hyprcursor.enable = true;
    name = "catppuccin-mocha-dark-cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 21;
};
}
