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
  
  # TODO:
  # - Add /var/lib/immich to persist
  # - Consider burying behind Nginx once web domain is up
  # - Consider using unstable branch package
}
