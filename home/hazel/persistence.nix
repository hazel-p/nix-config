{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.impermanence.homeManagerModules.impermanence
  ];

  home.persistence."/nix/home-persist" = {
    directories = [
      "nix-config"
      ".cache"
      ".config"
      ".local"
      {
        directory = ".ssh";
        mode = "0700";
      }
    ];
  };
}
