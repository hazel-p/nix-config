{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    inputs.impermanence.homeManagerModules.impermanence
  ];

  home.persistence."/nix/persist/home/hazel" = {
    directories = [
      "nix-config"
      ".cache"
      ".config"
      ".local"
      ".ssh"
    ];
  };
}
