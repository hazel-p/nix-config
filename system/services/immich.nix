# Immich setup
{
  pkgs,
  inputs,
  ...
}: {
  services.immich = {
    enable = true;
    port = 5000;
    host = "0.0.0.0";
    openFirewall = true;
    package = pkgs.immich;
  };

  #REMOVE UPON RELEASE OF 26.11 PLEASEEEEE
  nixpkgs.config.permittedInsecurePackages = [
    "immich-2.7.5"
  ];

  #environment.persistence."/nix/persist".directories = ["/var/lib/immich"];

  # TODO:
  # - Consider burying behind Nginx once web domain is up
  # - Consider using unstable branch package
}
