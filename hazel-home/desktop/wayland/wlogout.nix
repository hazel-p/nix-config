{
  outputs,
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  # Rofi Configuration
  programs.wlogout = {
    enable = true;
    
  };
}
