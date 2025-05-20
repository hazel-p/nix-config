{config, ...}: {
  services.seafile = {
    enable = true;
    
    adminEmail = "hazel.pumphrey@proton.me";
    initialAdminPassword = "change this later!";

    seahubAddress = "[::1]:8083";

    seafileSettings = {
      fileserver = {
        host = "0.0.0.0";
      };
    };
  };
}
