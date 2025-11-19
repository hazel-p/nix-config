{
  outputs,
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  # Rofi Configuration
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "${pkgs.rofi}/share/rofi/themes/material.rasi";
    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
    };
  };
}
