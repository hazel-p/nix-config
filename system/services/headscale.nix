{config, ...}: let
  derp-port = 3478;
  domain = "example.com";
in {
  # Sources:
  # https://notashelf.dev/posts/using-headscale
  # https://carlosvaz.com/posts/setting-up-headscale-on-nixos/
  # https://github.com/Misterio77/nix-config/blob/main/hosts/alcyone/services/headscale.nix

  # Generate key using:
  ## headscale apikeys create --expiration 90d
  # Add the generated key to secrets.yaml using sops

  services = {
    headscale = {
      enable = true;
      port = 8085;
      address = "127.0.0.1"; # maybe change to 0.0.0.0 if necesary?
      settings = {
        # Base settings
        server_url = "https://tailscale.${domain}";
        dns = {
          override_local_dns = true;
          base_domain = "${domain}";
          magic_dns = true;
          domains = ["tailscale.${domain}"];
          nameservers.global = ["9.9.9.9"];
        };
        prefixes = {
          v4 = "100.77.0.0/24";
          v6 = "fd7a:115c:a1e0:77::/64";
        };

        # Logging & rerouting
        metrics_listen_addr = "127.0.0.1:8095";
        logtail = {
          enabled = false;
        };
        log = {
          level = "warn";
        };
        derp.server = {
          enable = true;
          region_id = 999;
          stun_listen_addr = "0.0.0.0:${toString derp-port}";
        };
      };
    };

    nginx.virtualHosts = {
      "tailscale.${domain}" = {
        forceSSL = true;
        enableACME = true;
        locations = {
          "/" = {
            proxyPass = "http://localhost:${toString config.services.headscale.port}";
            proxyWebsockets = true;
          };
          "/metrics" = {
            proxyPass = "http://${config.services.headscale.settings.metrics_listen_addr}/metrics";
          };
        };
      };
    };
  };

  # Derp server
  networking.firewall.allowedUDPPorts = [derp-port];

  environment.systemPackages = [config.services.headscale.package];

  environment.persistence = {
    "/persist".directories = [
      {
        directory = "/var/lib/headscale";
        user = config.services.headscale.user;
        group = config.services.headscale.group;
        mode = "0700";
      }
    ];
  };
}
