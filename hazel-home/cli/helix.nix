{
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox";
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
      }
    ];
  };
}
