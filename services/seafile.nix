{config, ...}: {
  services.seafile = {
    enable = true;
    
    adminEmail = "hazel.pumphrey@proton.me";
    initialAdminPassword = "change this later!";

    ccnetSettings.General.SERVICE_URL = "http://100.66.121.60:8000";

    seafileSettings = {
      fileserver = {
        host = "unix:/run/seafile/server.sock";
      };
    };
  };
}
