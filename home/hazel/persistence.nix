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
    allowOther = true;
    directories = [
      "nix-config"
      ".cache"
      ".config"
      ".local"
      ".ssh"
    ];
  };
}
