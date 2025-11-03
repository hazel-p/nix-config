{config, ...}: {
  
  # Seafile Server - Not functioning fully
  # Can serve as an example of an initial configuration

  services.seafile = {
    enable = true;

    adminEmail = "hazel.pumphrey@proton.me";
    initialAdminPassword = "change this later!";

    ccnetSettings.General.SERVICE_URL = "http://0.0.0.0:8083";
    seahubAddress = "[::1]:8083";

    seafileSettings = {
      fileserver = {
        host = "0.0.0.0";
      };
    };
  };

  networking.firewall.allowedTCPPorts = [8083];
}
