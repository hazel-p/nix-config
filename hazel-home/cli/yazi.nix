{
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {

    };
  };
}
