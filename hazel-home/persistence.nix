{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [(inputs.impermanence + "/home-manager.nix")];
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
