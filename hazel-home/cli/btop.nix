{
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.btop = {
    enable = true;
    package = pkgs.btop-rocm; #Built with ROCM for AMD GPU compatibility

    # If this section causes errors, remove ~/.config/btop/btop.conf
    settings = {
      vim_keys = false;
      update_ms = 200;
      color_theme = "TTY";
      theme_background = false;
    };
  };
}
