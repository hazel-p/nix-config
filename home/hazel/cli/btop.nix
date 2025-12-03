{
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.btop = {
    enable = true;
    package = pkgs.btop-rocm; #Built with ROCM for AMD GPU compatibility
    settings.color_theme = "TTY";
    settings.theme_background = false;
  };
}
