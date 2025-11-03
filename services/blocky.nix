{config, ...}: {
  services.blocky = {
    enable = true;

    settings = {
      ports.dns = 53; # Port for incoming DNS Queries.

      upstreams.groups.default = [
        "https://one.one.one.one/dns-query" # Cloudflare
      ];

      # For initially solving DoH/DoT Requests when no system resolver is available.
      bootstrapDns = {
        upstream = "https://one.one.one.one/dns-query"; # Cloudflare
        ips = ["1.1.1.1" "1.0.0.1"]; # Cloudflare
      };

      # Enable blocking of certain domains.
      blocking = {
        denylists = {
          ads = ["https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"];
        };
        clientGroupsBlock = {
          default = ["ads"];
        };
      };
      
      # Caching behaviour
      caching = {
        minTime = "5m";
        maxTime = "30m";
        prefetching = true;
      };

    };
  };
}
