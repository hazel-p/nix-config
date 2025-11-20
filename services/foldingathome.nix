{config, pkgs, ...}: {
  environment.systemPackages = with pkgs; [
  ];
  services.foldingathome = {
    enable = true;
    user = "hazelp";
    daemonNiceLevel = 5;
  };
}
