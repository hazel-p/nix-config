{
  inputs,
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [pkgs.cifs-utils];
  fileSystems."/mnt/share" = {
    device = "//100.66.121.60/private";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in ["${automount_opts},user=samba-user,password=${config.sops.secrets."samba-password".path}"];
  };

  services.gvfs.enable = true;
}
