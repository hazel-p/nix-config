{config, ...}: {

  environment.etc."nextcloud-admin-pass".text = "PWD";
  services.nextcloud = {
    enable = true;
    hostName = "localhost";
    config.adminpassFile = "/etc/nextcloud-admin-pass";
  };
  networking.firewall.allowedTCPPorts = [80 443];
}
