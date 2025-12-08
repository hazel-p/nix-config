{
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
    settings = {
      theme = "amberwood";
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
      }
    ];
  };
}
