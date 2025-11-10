{config, ...}: let
  user = "samba-user";
  privatePath = "/mnt/Shares/Private";
in {
  # https://wiki.nixos.org/wiki/Samba#Server_setup
  # https://carlosvaz.com/posts/setting-up-samba-shares-on-nixos-with-support-for-macos-time-machine-backups

  sops.secrets."samba-password" = {};

  users.users.${user} = {
    description = "Write-access to samba media shares";
    extraGroups = [ "users" ];
    hashedPasswordFile = config.sops.secrets."samba-password".path;
    isNormalUser = true;
  };

  services = {
    samba = {
      enable = true;
      securityType = "user";
      openFirewall = true;

      settings = {
        global = {
          "workgroup" = "WORKGROUP";
          "server string" = "smbnix";
          "netbios name" = "smbnix";
          "security" = "user";

          # Only available on localhost and Tailscale
          # note: localhost is the ipv6 localhost ::1
          "hosts allow" = "100.64.0.0/10 127.0.0.1 localhost";
          "hosts deny" = "0.0.0.0/0";
          "guest account" = "nobody";
          "map to guest" = "bad user";
        };

        "private" = {
          "path" = privatePath;
          "browseable" = "yes";
          "read only" = "no";
          "guest ok" = "no";
          "create mask" = "0644";
          "directory mask" = "0755";         
          "force user" = user;
        };
      };
    };
  };

  system.activationScripts = {
    init_smbpasswd.text = ''
      /run/current-system/sw/bin/printf "$(/run/current-system/sw/bin/cat ${config.sops.secrets."samba-password".path})\n$(/run/current-system/sw/bin/cat ${config.sops.secrets."samba-password".path})\n" | /run/current-system/sw/bin/smbpasswd -sa ${user}
    '';
  };

  # Share path must be owned by the respective unix user. (e.g. ❯ chown -R samba: /samba)
  systemd.tmpfiles.rules = [
    "d ${privatePath} 0755 ${user} users"
  ];
}
