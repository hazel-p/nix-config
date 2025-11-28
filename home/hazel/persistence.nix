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
      ".ssh"
    ];
  };
}
