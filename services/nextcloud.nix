{config, ...}: {

  environment.etc."nextcloud-admin-pass".text = "PWD";
  services.nextcloud = {
    enable = true;
    hostName = "localhost";
    database.createLocally = true;
    config.adminpassFile = "/etc/nextcloud-admin-pass";
    config.dbtype = "sqlite";
  };
  networking.firewall.allowedTCPPorts = [80 443];
}
