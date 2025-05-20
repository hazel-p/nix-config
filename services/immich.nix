# Immich setup
{
  pkgs,
  inputs,
  ...
}: {
  services.immich = {
    enable = true;
    port = 5000;
    openFirewall = true;
  };
}
