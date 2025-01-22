{config, ...}: {
  sops.secrets."tailscale-authkey" = {};

  services.tailscale = {
    enable = true;
    openFirewall = true;
    authKeyFile = config.sops.secrets."tailscale-authkey".path;
    useRoutingFeatures = "server";
  };
  /* TODO: Add persistence
  environment.persistence."/nix/persist" = {
    directories = [
      "/var/lib/tailscale"
    ];
  };
  */
}
