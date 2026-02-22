{
  inputs,
  config,
  pkgs,
  ...
}: {
  sops.secrets."samba-password" = {};

  services.samba.enable = true;

  environment.systemPackages = [pkgs.cifs-utils];
  fileSystems."/mnt/nas" = {
    device = "//100.66.121.60/private";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in ["${automount_opts},user=hazel,password=${config.sops.secrets."samba-password".path},uid=1000,gid=100"];
  };

  services.gvfs.enable = true;

  networking.firewall.extraCommands = ''iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns'';

  users.users."samba-user".isNormalUser = true;
  systemd.tmpfiles.rules = [
    "d /mnt/nas 0755 hazel users"
  ];
}
