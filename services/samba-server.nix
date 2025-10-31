{config, ...}: let
  user = "samba";
  privatePath = "/var/lib/samba/private";
in {
  # https://wiki.nixos.org/wiki/Samba#Server_setup
  # https://carlosvaz.com/posts/setting-up-samba-shares-on-nixos-with-support-for-macos-time-machine-backups
  services = {
    samba = {
      enable = true;

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
          "valid users" = user;
          "public" = "no";
          "writeable" = "yes";
          "force user" = user;
        };
      };
    };
  };

  # Set up password: https://wiki.nixos.org/wiki/Samba#User_Authentication
  users.users.${user}.isNormalUser = true;

  # Share path must be owned by the respective unix user. (e.g. ❯ chown -R samba: /samba)
  systemd.tmpfiles.rules = [
    "d ${privatePath} 0755 ${user} users"
  ];
}
