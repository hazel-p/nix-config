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
      update_ms = 200;
      color_theme = "TTY";
      theme_background = false;
    };
  };
}
