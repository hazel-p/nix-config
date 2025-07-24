{config, ...}: {

  environment.etc."nextcloud-admin-pass".text = "PWD";
  services.nextcloud = {
    enable = true;
    hostName = "localhost";
    config.adminpassFile = "/etc/nextcloud-admin-pass";
    config.dbtype = "pgsql";
  };
  networking.firewall.allowedTCPPorts = [80 443];
}
