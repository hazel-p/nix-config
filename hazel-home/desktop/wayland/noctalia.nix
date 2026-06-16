{
  outputs,
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    settings = {
      
    };
  };
}
