{
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.btop = {
    enable = true;
    package = pkgs.btop-rocm; #Built with ROCM for AMD GPU compatibility
    settings = {
      vim_keys = true;
      color_theme = "TTY";
      theme_background = false;
    };
  };
}
