{config, ...}: {
  sops.secrets."tailscale-authkey" = {};

  services.tailscale = {
    enable = true;
    openFirewall = true;
    authKeyFile = config.sops.secrets."tailscale-authkey".path;
    useRoutingFeatures = "both";
  };

        #environment.persistence."/nix/persist".directories = ["/var/lib/tailscale"];
}
