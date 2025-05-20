# Immich setup
{
  pkgs,
  inputs,
  ...
}: {
  services.immich = {
    enable = true;
    port = 5000;
    host="0.0.0.0";
    openFirewall = true;
  };
}
