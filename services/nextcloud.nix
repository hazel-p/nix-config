{config, ...}: {

  environment.etc."nextcloud-admin-pass".text = "PWD";
  services.nextcloud = {
    enable = false;
    hostName = "localhost";
    config.dbtype = "sqlite";
    config.adminpassFile = "/etc/nextcloud-admin-pass";
    settings.trusted_domains = ["192.168.0.2" "100.66.121.60"];
  };
  networking.firewall.allowedTCPPorts = [80 443];
}
