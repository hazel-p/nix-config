{config, ...}: {
  services.borgbackup.jobs.hazel-home = {
    paths = "/nix/persist";
    encryption.mode = "none";
    environment.BORG_RSH = "ssh -i /home/hazel/.ssh/id_ed25519";
    repo = "ssh://100.66.121.60:23/var/backups/clio";
    compression = "auto,zstd";
    startAt = "daily";
  };
}
