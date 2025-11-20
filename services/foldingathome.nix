{config, pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    fahviewer
    fahcontrol
  ];
  services.foldingathome = {
    enable = true;
    user = "hazel-p";
    daemonNiceLevel = 15;
  };
}
