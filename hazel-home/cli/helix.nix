{
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
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
