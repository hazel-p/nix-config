{config, ...}: {
  services.seafile = {
    enable = true;
    
    adminEmail = "hazel.pumphrey@proton.me";
    initialAdminPassword = "change this later!";

    ccnetSettings.General.SERVICE_URL = "http://127.0.0.1:8000";


    seafileSettings = {
      fileserver = {
        host = "unix:/run/seafile/server.sock";
      };
    };
  };
}
